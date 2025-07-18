using System.Windows.Input;
using Microsoft.Extensions.DependencyInjection;
using projekt.Commands;
using projekt.Services;
using projekt.Views;
using projekt.Data;
using Microsoft.EntityFrameworkCore;

namespace projekt.ViewModels;

public class MainViewModel : BaseViewModel
{
    private readonly INavigationService _navigationService;
    private object? _currentView;
    private object? _previousView; // ======== HOZZÁADVA: Előző nézet tárolása ========
    
    // ======== HOZZÁADVA: Statisztikai property-k ========
    private int _usersCount;
    private int _moviesCount;
    private int _actorsCount;
    
    public int UsersCount
    {
        get => _usersCount;
        set => SetProperty(ref _usersCount, value);
    }
    
    public int MoviesCount
    {
        get => _moviesCount;
        set => SetProperty(ref _moviesCount, value);
    }
    
    public int ActorsCount
    {
        get => _actorsCount;
        set => SetProperty(ref _actorsCount, value);
    }
    // ======== HOZZÁADÁS VÉGE ========

    public MainViewModel(INavigationService navigationService)
    {
        _navigationService = navigationService;
        
        // Commands
        LogoutCommand = new RelayCommand(Logout);
        ShowHomeCommand = new RelayCommand(ShowHome); // ======== HOZZÁADVA ========
        ShowUsersCommand = new RelayCommand(ShowUsers);
        ShowMoviesCommand = new RelayCommand(ShowMovies);
        ShowActorsCommand = new RelayCommand(ShowActors);
        ShowStatisticsCommand = new RelayCommand(ShowStatistics);
        BackCommand = new RelayCommand(GoBack, CanGoBack);
        
        // ======== HOZZÁADVA: Statisztikák betöltése és kezdőlap ========
        Task.Run(async () => await LoadStatisticsAsync());
        ShowHome();
        // ======== HOZZÁADÁS VÉGE ========
    }

    public object? CurrentView
    {
        get => _currentView;
        set 
        {
            // ======== JAVÍTÁS: Előző nézet mentése ========
            if (_currentView != null && _currentView != value)
            {
                _previousView = _currentView;
            }
            // ======== JAVÍTÁS VÉGE ========
            SetProperty(ref _currentView, value);
        }
    }

    public ICommand LogoutCommand { get; }
    public ICommand ShowHomeCommand { get; } // ======== HOZZÁADVA ========
    public ICommand ShowUsersCommand { get; }
    public ICommand ShowMoviesCommand { get; }
    public ICommand ShowActorsCommand { get; }
    public ICommand ShowStatisticsCommand { get; }
    public ICommand BackCommand { get; }

    private void Logout()
    {
        CurrentUserService.CurrentUser = null;
        _navigationService.NavigateTo<LoginWindow>();
    }

    // ======== HOZZÁADVA: ShowHome metódus ========
    private void ShowHome()
    {
        // Egyszerű kezdőlap létrehozása TextBlock-kal
        var homeView = new System.Windows.Controls.TextBlock
        {
            Text = "Film Database Management App",
            FontSize = 32,
            FontWeight = System.Windows.FontWeights.Bold,
            HorizontalAlignment = System.Windows.HorizontalAlignment.Center,
            VerticalAlignment = System.Windows.VerticalAlignment.Center,
            Foreground = new System.Windows.Media.SolidColorBrush(System.Windows.Media.Color.FromRgb(45, 55, 72)),
            TextAlignment = System.Windows.TextAlignment.Center,
            Margin = new System.Windows.Thickness(50)
        };
        
        var welcomePanel = new System.Windows.Controls.StackPanel
        {
            Orientation = System.Windows.Controls.Orientation.Vertical,
            HorizontalAlignment = System.Windows.HorizontalAlignment.Center,
            VerticalAlignment = System.Windows.VerticalAlignment.Center
        };
        
        welcomePanel.Children.Add(homeView);
        
        if (CurrentUserService.CurrentUser != null)
        {
            var welcomeText = new System.Windows.Controls.TextBlock
            {
                Text = $"Welcome, {CurrentUserService.CurrentUser.Name}!",
                FontSize = 18,
                HorizontalAlignment = System.Windows.HorizontalAlignment.Center,
                Margin = new System.Windows.Thickness(0, 20, 0, 0),
                Foreground = new System.Windows.Media.SolidColorBrush(System.Windows.Media.Color.FromRgb(102, 126, 234))
            };
            welcomePanel.Children.Add(welcomeText);
        }
        
        CurrentView = welcomePanel;
    }
    // ======== HOZZÁADÁS VÉGE ========

    private void ShowUsers()
    {
        var usersView = new UsersView();
        if (System.Windows.Application.Current is App app && app.Services != null)
        {
            var viewModel = app.Services.GetService<UsersViewModel>();
            usersView.DataContext = viewModel;
        }
        CurrentView = usersView;
        
        // ======== HOZZÁADVA: Statisztikák frissítése ========
        Task.Run(async () => await RefreshStatisticsAsync());
        // ======== HOZZÁADÁS VÉGE ========
    }

    private void ShowMovies()
    {
        var moviesView = new MoviesView();
        if (System.Windows.Application.Current is App app && app.Services != null)
        {
            var viewModel = app.Services.GetService<MoviesViewModel>();
            moviesView.DataContext = viewModel;
        }
        CurrentView = moviesView;
        
        // ======== HOZZÁADVA: Statisztikák frissítése ========
        Task.Run(async () => await RefreshStatisticsAsync());
        // ======== HOZZÁADÁS VÉGE ========
    }

    private void ShowActors()
    {
        var actorsView = new ActorsView();
        if (System.Windows.Application.Current is App app && app.Services != null)
        {
            var viewModel = app.Services.GetService<ActorsViewModel>();
            actorsView.DataContext = viewModel;
        }
        CurrentView = actorsView;
        
        // ======== HOZZÁADVA: Statisztikák frissítése ========
        Task.Run(async () => await RefreshStatisticsAsync());
        // ======== HOZZÁADÁS VÉGE ========
    }

    private void ShowStatistics()
    {
        var statisticsWindow = new StatisticsWindow();
        if (System.Windows.Application.Current is App app && app.Services != null)
        {
            var viewModel = app.Services.GetService<StatisticsViewModel>();
            statisticsWindow.DataContext = viewModel;
        }
        statisticsWindow.ShowDialog();
    }

    private void GoBack()
    {
        // ======== JAVÍTÁS: Előző nézetre visszatérés ========
        if (_previousView != null)
        {
            var temp = _previousView;
            _previousView = _currentView;
            CurrentView = temp;
        }
        else
        {
            ShowHome(); // Ha nincs előző nézet, menjen a kezdőlapra
        }
        // ======== JAVÍTÁS VÉGE ========
    }

    private bool CanGoBack()
    {
        return CurrentView != null;
    }
    
    // ======== HOZZÁADVA: Statisztikák betöltése ========
    private async Task LoadStatisticsAsync()
    {
        try
        {
            using var context = new MoviesDbContext();
            UsersCount = await context.Users.CountAsync();
            MoviesCount = await context.Movies.CountAsync();
            ActorsCount = await context.Actors.CountAsync();
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Hiba a statisztikák betöltése során: {ex.Message}");
        }
    }
    
    public async Task RefreshStatisticsAsync()
    {
        await LoadStatisticsAsync();
    }
    // ======== HOZZÁADÁS VÉGE ========
}
