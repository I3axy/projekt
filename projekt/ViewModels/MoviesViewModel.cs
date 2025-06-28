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

    public MoviesViewModel(MoviesDbContext context)
    {
        _context = context;
        
        AddCommand = new RelayCommand(AddMovie);
        DeleteCommand = new RelayCommand(DeleteMovie, () => SelectedMovie != null);
        SearchCommand = new RelayCommand(async () => await SearchAsync());
        
        LoadMoviesAsync();
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

    public ICommand AddCommand { get; }
    public ICommand DeleteCommand { get; }
    public ICommand SearchCommand { get; }

    private async void LoadMoviesAsync()
    {
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

    private void AddMovie()
    {
        // Show add movie dialog
        var addMovieWindow = new AddMovieWindow();
        if (addMovieWindow.ShowDialog() == true)
        {
            LoadMoviesAsync();
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
}

public class MovieDisplayModel
{
    public int MovieID { get; set; }
    public string Title { get; set; } = string.Empty;
    public DateTime? ReleaseDate { get; set; }
    public int? DurationMinutes { get; set; }
    public double AverageRating { get; set; }
}
