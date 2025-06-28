using System.ComponentModel.DataAnnotations;
using System.Windows;
using System.Windows.Input;
using projekt.Commands;
using projekt.Services;
using projekt.Views;

namespace projekt.ViewModels;

public class LoginViewModel : BaseViewModel
{
    private readonly IAuthenticationService _authService;
    private readonly INavigationService _navigationService;
    private string _email = string.Empty;
    private string _password = string.Empty;
    private string _errorMessage = string.Empty;
    private bool _isLoading;

    public LoginViewModel(IAuthenticationService authService, INavigationService navigationService)
    {
        _authService = authService;
        _navigationService = navigationService;
        LoginCommand = new RelayCommand(async () => await LoginAsync(), CanLogin);
    }

    public string Email
    {
        get => _email;
        set => SetProperty(ref _email, value);
    }

    public string Password
    {
        get => _password;
        set => SetProperty(ref _password, value);
    }

    public string ErrorMessage
    {
        get => _errorMessage;
        set => SetProperty(ref _errorMessage, value);
    }

    public bool IsLoading
    {
        get => _isLoading;
        set => SetProperty(ref _isLoading, value);
    }

    public ICommand LoginCommand { get; }

    private bool CanLogin()
    {
        return !IsLoading && !string.IsNullOrWhiteSpace(Email) && !string.IsNullOrWhiteSpace(Password);
    }

    private async Task LoginAsync()
    {
        if (!IsValidEmail(Email))
        {
            ErrorMessage = "Please enter a valid email address.";
            return;
        }

        IsLoading = true;
        ErrorMessage = string.Empty;

        try
        {
            var user = await _authService.AuthenticateAsync(Email, Password);
            
            if (user != null)
            {
                // Store current user in a static property or service
                CurrentUserService.CurrentUser = user;
                _navigationService.NavigateTo<MainWindow>();
            }
            else
            {
                ErrorMessage = "Invalid email or password.";
            }
        }
        catch (Exception ex)
        {
            ErrorMessage = $"Login failed: {ex.Message}";
        }
        finally
        {
            IsLoading = false;
        }
    }

    private static bool IsValidEmail(string email)
    {
        return new EmailAddressAttribute().IsValid(email);
    }
}

public static class CurrentUserService
{
    public static projekt.Models.User? CurrentUser { get; set; }
}
