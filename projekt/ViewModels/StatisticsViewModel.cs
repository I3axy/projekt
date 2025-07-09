using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Windows.Input;
using Microsoft.EntityFrameworkCore;
using projekt.Commands;
using projekt.Data;

namespace projekt.ViewModels;

public class StatisticsViewModel : BaseViewModel
{
    private readonly MoviesDbContext _context;
    private ObservableCollection<dynamic> _statisticsResults = new();

    public StatisticsViewModel(MoviesDbContext context)
    {
        _context = context;
        
        DurationStatsCommand = new RelayCommand(async () => await GetDurationStatsAsync());
        Top5RatedCommand = new RelayCommand(async () => await GetTop5RatedAsync());
        RatingByGenreCommand = new RelayCommand(async () => await GetRatingByGenreAsync());
    }

    public ObservableCollection<dynamic> StatisticsResults
    {
        get => _statisticsResults;
        set => SetProperty(ref _statisticsResults, value);
    }

    public ICommand DurationStatsCommand { get; }
    public ICommand Top5RatedCommand { get; }
    public ICommand RatingByGenreCommand { get; }

    private async Task GetDurationStatsAsync()
    {
        var shortest = await _context.Movies
            .Where(m => m.DurationMinutes.HasValue)
            .OrderBy(m => m.DurationMinutes)
            .Select(m => new { Type = "Shortest", m.Title, m.DurationMinutes })
            .FirstOrDefaultAsync();

        var longest = await _context.Movies
            .Where(m => m.DurationMinutes.HasValue)
            .OrderByDescending(m => m.DurationMinutes)
            .Select(m => new { Type = "Longest", m.Title, m.DurationMinutes })
            .FirstOrDefaultAsync();

        var results = new List<dynamic>();
        if (shortest != null) results.Add(shortest);
        if (longest != null) results.Add(longest);

        StatisticsResults = new ObservableCollection<dynamic>(results);
    }

    private async Task GetTop5RatedAsync()
    {
        var results = await _context.Movies
            .Include(m => m.UserRatings)
            .Where(m => m.UserRatings.Any())
            .Select(m => new
            {
                Title = m.Title,
                AverageRating = m.UserRatings.Average(ur => (double)ur.Rating),
                RatingCount = m.UserRatings.Count()
            })
            .OrderByDescending(m => m.AverageRating)
            .Take(5)
            .ToListAsync();

        StatisticsResults = new ObservableCollection<dynamic>(results);
    }

    private async Task GetRatingByGenreAsync()
    {
        var results = await _context.Genres
            .Include(g => g.MovieGenres)
                .ThenInclude(mg => mg.Movie)
                    .ThenInclude(m => m.UserRatings)
            .Where(g => g.MovieGenres.Any(mg => mg.Movie.UserRatings.Any()))
            .Select(g => new
            {
                Genre = g.Name,
                AverageRating = g.MovieGenres
                    .SelectMany(mg => mg.Movie.UserRatings)
                    .Average(ur => (double)ur.Rating)
            })
            .ToListAsync();

        StatisticsResults = new ObservableCollection<dynamic>(results);
    }
}
