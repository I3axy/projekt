using System.Windows.Input;
using Microsoft.Extensions.DependencyInjection;
using projekt.Commands;
using projekt.Services;
using projekt.Views;

namespace projekt.ViewModels;

public class MainViewModel : BaseViewModel
{
    private readonly INavigationService _navigationService;
    private object? _currentView;

    public MainViewModel(INavigationService navigationService)
    {
        _navigationService = navigationService;
        
        // Commands
        LogoutCommand = new RelayCommand(Logout);
        ShowUsersCommand = new RelayCommand(ShowUsers);
        ShowMoviesCommand = new RelayCommand(ShowMovies);
        ShowActorsCommand = new RelayCommand(ShowActors);
        ShowStatisticsCommand = new RelayCommand(ShowStatistics);
        BackCommand = new RelayCommand(GoBack, CanGoBack);
    }

    public object? CurrentView
    {
        get => _currentView;
        set => SetProperty(ref _currentView, value);
    }

    public ICommand LogoutCommand { get; }
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

    private void ShowUsers()
    {
        var usersView = new UsersView();
        if (System.Windows.Application.Current is App app && app.Services != null)
        {
            var viewModel = app.Services.GetService<UsersViewModel>();
            usersView.DataContext = viewModel;
        }
        CurrentView = usersView;
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
        CurrentView = null;
    }

    private bool CanGoBack()
    {
        return CurrentView != null;
    }
}
