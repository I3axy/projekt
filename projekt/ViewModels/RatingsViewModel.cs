using System.Collections.ObjectModel;
using System.Windows.Input;
using Microsoft.EntityFrameworkCore;
using projekt.Commands;
using projekt.Data;
using projekt.Models;
using projekt.Views;

namespace projekt.ViewModels;

public class RatingsViewModel : BaseViewModel
{
    private readonly MoviesDbContext _context;
    private readonly int _movieId;
    private ObservableCollection<UserRatingDisplayModel> _ratings = new();
    private UserRatingDisplayModel? _selectedRating;
    private string _movieTitle = string.Empty;
    private double _averageRating;
    private int _totalRatings;
    private bool _hasChanges = false;

    public RatingsViewModel(MoviesDbContext context, int movieId, string movieTitle)
    {
        _context = context;
        _movieId = movieId;
        _movieTitle = movieTitle;
        
        AddRatingCommand = new RelayCommand(AddRating);
        DeleteRatingCommand = new RelayCommand(DeleteRating, () => SelectedRating != null);
        SaveCommand = new RelayCommand(async () => await SaveChangesAsync(), () => HasChanges);
        
        Task.Run(async () => await LoadRatingsAsync());
    }

    public ObservableCollection<UserRatingDisplayModel> Ratings
    {
        get => _ratings;
        set => SetProperty(ref _ratings, value);
    }

    public UserRatingDisplayModel? SelectedRating
    {
        get => _selectedRating;
        set => SetProperty(ref _selectedRating, value);
    }

    public string MovieTitle
    {
        get => _movieTitle;
        set => SetProperty(ref _movieTitle, value);
    }

    public double AverageRating
    {
        get => _averageRating;
        set => SetProperty(ref _averageRating, value);
    }

    public int TotalRatings
    {
        get => _totalRatings;
        set => SetProperty(ref _totalRatings, value);
    }

    public bool HasChanges
    {
        get => _hasChanges;
        set => SetProperty(ref _hasChanges, value);
    }

    public ICommand AddRatingCommand { get; }
    public ICommand DeleteRatingCommand { get; }
    public ICommand SaveCommand { get; }

    private async Task LoadRatingsAsync()
    {
        try
        {
            _context.ChangeTracker.Clear();
            
            var ratingsQuery = await _context.UserRatings
                .Include(ur => ur.User)
                .Where(ur => ur.MovieID == _movieId)
                .Select(ur => new UserRatingDisplayModel
                {
                    UserID = ur.UserID,
                    MovieID = ur.MovieID,
                    Rating = ur.Rating,
                    RatedAt = ur.RatedAt,
                    UserName = ur.User.Name,
                    UserEmail = ur.User.Email
                })
                .ToListAsync();
            
            Ratings = new ObservableCollection<UserRatingDisplayModel>(ratingsQuery);
            
            // Átlag és összesítés kiszámítása
            if (Ratings.Any())
            {
                AverageRating = Ratings.Average(r => r.Rating);
                TotalRatings = Ratings.Count;
            }
            else
            {
                AverageRating = 0;
                TotalRatings = 0;
            }
            
            HasChanges = false;
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Hiba a ratingek betöltése során: {ex.Message}");
            Ratings = new ObservableCollection<UserRatingDisplayModel>();
        }
    }

    private async void AddRating()
    {
        var addRatingWindow = new AddRatingWindow(_movieId);
        if (addRatingWindow.ShowDialog() == true)
        {
            await LoadRatingsAsync();
        }
    }

    private async void DeleteRating()
    {
        if (SelectedRating != null)
        {
            try
            {
                var rating = await _context.UserRatings
                    .FirstOrDefaultAsync(ur => ur.UserID == SelectedRating.UserID && ur.MovieID == SelectedRating.MovieID);
                
                if (rating != null)
                {
                    _context.UserRatings.Remove(rating);
                    await _context.SaveChangesAsync();
                    Ratings.Remove(SelectedRating);
                    
                    // Átlag újraszámítása
                    if (Ratings.Any())
                    {
                        AverageRating = Ratings.Average(r => r.Rating);
                        TotalRatings = Ratings.Count;
                    }
                    else
                    {
                        AverageRating = 0;
                        TotalRatings = 0;
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Hiba a rating törlése során: {ex.Message}");
            }
        }
    }

    private async Task SaveChangesAsync()
    {
        try
        {
            System.Diagnostics.Debug.WriteLine("Rating mentés kezdése...");
            
            foreach (var ratingDisplay in Ratings)
            {
                var dbRating = await _context.UserRatings
                    .FirstOrDefaultAsync(ur => ur.UserID == ratingDisplay.UserID && ur.MovieID == ratingDisplay.MovieID);
                
                if (dbRating != null)
                {
                    if (dbRating.Rating != ratingDisplay.Rating)
                    {
                        System.Diagnostics.Debug.WriteLine($"Rating változás: {dbRating.Rating} -> {ratingDisplay.Rating}");
                        dbRating.Rating = ratingDisplay.Rating;
                        dbRating.RatedAt = DateTime.Now; // Frissítjük a dátumot is
                    }
                }
            }
            
            var changes = await _context.SaveChangesAsync();
            System.Diagnostics.Debug.WriteLine($"Mentve {changes} rating változás az adatbázisba.");
            
            HasChanges = false;
            
            // Újratöltjük az adatokat
            await LoadRatingsAsync();
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Hiba a rating mentés során: {ex.Message}");
            System.Diagnostics.Debug.WriteLine($"StackTrace: {ex.StackTrace}");
        }
    }
}

public class UserRatingDisplayModel
{
    public int UserID { get; set; }
    public int MovieID { get; set; }
    public byte Rating { get; set; }
    public DateTime RatedAt { get; set; }
    public string UserName { get; set; } = string.Empty;
    public string UserEmail { get; set; } = string.Empty;
}
