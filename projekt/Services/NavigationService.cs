using System.Windows;
using Microsoft.Extensions.DependencyInjection;
using projekt.ViewModels;

namespace projekt.Services;

public interface INavigationService
{
    void NavigateTo<T>() where T : Window, new();
    void NavigateTo<T>(object parameter) where T : Window, new();
    void NavigateBack();
    void CloseCurrentWindow();
}

public class NavigationService : INavigationService
{
    private readonly Stack<Window> _navigationStack = new();
    private Window? _currentWindow;

    public void NavigateTo<T>() where T : Window, new()
    {
        NavigateTo<T>(null!);
    }

    public void NavigateTo<T>(object parameter) where T : Window, new()
    {
        var newWindow = new T();
        
        // Set up MainWindow with proper DataContext
        if (newWindow is MainWindow mainWindow)
        {
            if (System.Windows.Application.Current is App app && app.Services != null)
            {
                var mainViewModel = app.Services.GetService<MainViewModel>();
                mainWindow.DataContext = mainViewModel;
            }
        }
        
        // ======== HOZZÁADVA: LoginWindow DataContext beállítása ========
        if (newWindow is projekt.Views.LoginWindow loginWindow)
        {
            if (System.Windows.Application.Current is App app && app.Services != null)
            {
                var loginViewModel = app.Services.GetService<LoginViewModel>();
                loginWindow.DataContext = loginViewModel;
            }
        }
        // ======== HOZZÁADÁS VÉGE ========
        
        if (parameter != null && newWindow.DataContext != null)
        {
            // Try to set parameter if the DataContext has a Parameter property
            var parameterProperty = newWindow.DataContext.GetType().GetProperty("Parameter");
            parameterProperty?.SetValue(newWindow.DataContext, parameter);
        }

        // ======== JAVÍTÁS: Bejelentkezési ablak bezárása ========
        // Ha MainWindow-ra navigálunk, zárjuk be az összes előző ablakot
        if (newWindow is MainWindow)
        {
            // Zárjuk be az összes nyitott ablakot
            foreach (Window window in System.Windows.Application.Current.Windows)
            {
                if (window != newWindow && window.GetType().Name == "LoginWindow")
                {
                    window.Close();
                }
            }
            _currentWindow = null;
        }
        else if (_currentWindow != null)
        {
            _navigationStack.Push(_currentWindow);
            _currentWindow.Hide();
        }
        // ======== JAVÍTÁS VÉGE ========

        _currentWindow = newWindow;
        newWindow.Show();
    }

    public void NavigateBack()
    {
        if (_navigationStack.Count > 0)
        {
            _currentWindow?.Close();
            _currentWindow = _navigationStack.Pop();
            _currentWindow.Show();
        }
    }

    public void CloseCurrentWindow()
    {
        _currentWindow?.Close();
        _currentWindow = null;
    }
}
