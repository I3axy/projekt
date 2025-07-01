using System.Collections.ObjectModel;
using System.Windows.Input;
using Microsoft.EntityFrameworkCore;
using projekt.Commands;
using projekt.Data;
using projekt.Models;
using projekt.Views;

namespace projekt.ViewModels;

public class MoviesViewModel : BaseViewModel
{
    private readonly MoviesDbContext _context;
    private ObservableCollection<MovieDisplayModel> _movies = new();
    private MovieDisplayModel? _selectedMovie;
    private string _searchText = string.Empty;
    private bool _hasChanges = false; // ======== HOZZÁADVA ========

    public MoviesViewModel(MoviesDbContext context)
    {
        _context = context;
        
        AddCommand = new RelayCommand(AddMovie);
        DeleteCommand = new RelayCommand(DeleteMovie, () => SelectedMovie != null);
        SearchCommand = new RelayCommand(async () => await SearchAsync());
        SaveCommand = new RelayCommand(async () => await SaveChangesAsync(), () => HasChanges); // ======== HOZZÁADVA ========
        RatingsCommand = new RelayCommand(ShowRatings, () => SelectedMovie != null); // ======== HOZZÁADVA ========
        
        Task.Run(async () => await LoadMoviesAsync());
    }

    public ObservableCollection<MovieDisplayModel> Movies
    {
        get => _movies;
        set => SetProperty(ref _movies, value);
    }

    public MovieDisplayModel? SelectedMovie
    {
        get => _selectedMovie;
        set => SetProperty(ref _selectedMovie, value);
    }

    public string SearchText
    {
        get => _searchText;
        set => SetProperty(ref _searchText, value);
    }

    // ======== HOZZÁADVA: HasChanges tulajdonság ========
    public bool HasChanges
    {
        get => _hasChanges;
        set => SetProperty(ref _hasChanges, value);
    }
    // ======== HOZZÁADÁS VÉGE ========

    public ICommand AddCommand { get; }
    public ICommand DeleteCommand { get; }
    public ICommand SearchCommand { get; }
    public ICommand SaveCommand { get; } // ======== HOZZÁADVA ========
    public ICommand RatingsCommand { get; } // ======== HOZZÁADVA ========

    private async Task LoadMoviesAsync()
    {
        try
        {
            _context.ChangeTracker.Clear(); // Tisztítsuk meg a change trackert
            var movies = await _context.Movies
                .Include(m => m.UserRatings)
                .Select(m => new MovieDisplayModel
                {
                    MovieID = m.MovieID,
                    Title = m.Title,
                    ReleaseDate = m.ReleaseDate,
                    DurationMinutes = m.DurationMinutes,
                    AverageRating = m.UserRatings.Any() ? m.UserRatings.Average(ur => ur.Rating) : 0
                })
                .ToListAsync();
            
            Movies = new ObservableCollection<MovieDisplayModel>(movies);
            HasChanges = false; // Reset changes flag
        }
        catch (Exception)
        {
            // Handle error silently for now
            Movies = new ObservableCollection<MovieDisplayModel>();
        }
    }

    private async Task SearchAsync()
    {
        IQueryable<Movie> query = _context.Movies.Include(m => m.UserRatings);
        
        if (!string.IsNullOrWhiteSpace(SearchText))
        {
            query = query.Where(m => m.Title.Contains(SearchText));
        }
        
        var movies = await query
            .Select(m => new MovieDisplayModel
            {
                MovieID = m.MovieID,
                Title = m.Title,
                ReleaseDate = m.ReleaseDate,
                DurationMinutes = m.DurationMinutes,
                AverageRating = m.UserRatings.Any() ? m.UserRatings.Average(ur => ur.Rating) : 0
            })
            .ToListAsync();
        
        Movies = new ObservableCollection<MovieDisplayModel>(movies);
    }

    private async void AddMovie()
    {
        // Show add movie dialog
        var addMovieWindow = new AddMovieWindow();
        if (addMovieWindow.ShowDialog() == true)
        {
            await LoadMoviesAsync();
        }
    }

    private async void DeleteMovie()
    {
        if (SelectedMovie != null)
        {
            var movie = await _context.Movies.FindAsync(SelectedMovie.MovieID);
            if (movie != null)
            {
                _context.Movies.Remove(movie);
                await _context.SaveChangesAsync();
                Movies.Remove(SelectedMovie);
            }
        }
    }

    // ======== HOZZÁADVA: SaveChangesAsync metódus filmekhez ========
    private async Task SaveChangesAsync()
    {
        try
        {
            System.Diagnostics.Debug.WriteLine("Film mentés kezdése...");
            
            foreach (var movieDisplay in Movies)
            {
                var dbMovie = await _context.Movies.FindAsync(movieDisplay.MovieID);
                if (dbMovie != null)
                {
                    if (dbMovie.Title != movieDisplay.Title)
                    {
                        System.Diagnostics.Debug.WriteLine($"Film cím változás: {dbMovie.Title} -> {movieDisplay.Title}");
                        dbMovie.Title = movieDisplay.Title;
                    }
                    if (dbMovie.ReleaseDate != movieDisplay.ReleaseDate)
                    {
                        System.Diagnostics.Debug.WriteLine($"Megjelenés dátuma változás: {dbMovie.ReleaseDate} -> {movieDisplay.ReleaseDate}");
                        dbMovie.ReleaseDate = movieDisplay.ReleaseDate;
                    }
                    if (dbMovie.DurationMinutes != movieDisplay.DurationMinutes)
                    {
                        System.Diagnostics.Debug.WriteLine($"Időtartam változás: {dbMovie.DurationMinutes} -> {movieDisplay.DurationMinutes}");
                        dbMovie.DurationMinutes = movieDisplay.DurationMinutes;
                    }
                }
            }
            
            var changes = await _context.SaveChangesAsync();
            System.Diagnostics.Debug.WriteLine($"Mentve {changes} film változás az adatbázisba.");
            
            HasChanges = false;
            
            // Újratöltjük az adatokat
            LoadMoviesAsync();
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Hiba a film mentés során: {ex.Message}");
        }
    }
    // ======== HOZZÁADÁS VÉGE ========

    // ======== HOZZÁADVA: ShowRatings metódus ========
    private void ShowRatings()
    {
        if (SelectedMovie != null)
        {
            var ratingsWindow = new RatingsWindow(SelectedMovie.MovieID, SelectedMovie.Title);
            ratingsWindow.ShowDialog();
            
            // Újratöltjük a filmeket, hogy az esetlegesen megváltozott átlagot megmutassuk
            Task.Run(async () => await LoadMoviesAsync());
        }
    }
    // ======== HOZZÁADÁS VÉGE ========
}

public class MovieDisplayModel
{
    public int MovieID { get; set; }
    public string Title { get; set; } = string.Empty;
    public DateTime? ReleaseDate { get; set; }
    public int? DurationMinutes { get; set; }
    public double AverageRating { get; set; }
}
