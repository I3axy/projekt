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
    private bool _isPasswordVisible = false;

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

    public bool IsPasswordVisible
    {
        get => _isPasswordVisible;
        set => SetProperty(ref _isPasswordVisible, value);
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
            // ======== DEBUG: BEJELENTKEZÉSI KÍSÉRLET - TÖRLENDŐ ÉLES VERZIÓBAN ========
            System.Diagnostics.Debug.WriteLine($"DEBUG: Bejelentkezési kísérlet:");
            System.Diagnostics.Debug.WriteLine($"  Email: {Email}");
            System.Diagnostics.Debug.WriteLine($"  Jelszó: {Password}");
            
            // Hash kiszámítása debug céljára
            using var sha256 = System.Security.Cryptography.SHA256.Create();
            var hashedBytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(Password));
            var hexHash = Convert.ToHexString(hashedBytes);
            System.Diagnostics.Debug.WriteLine($"  Számított hash: {hexHash}");
            // ======== DEBUG VÉGE ========
            
            var user = await _authService.AuthenticateAsync(Email, Password);
            
            if (user != null)
            {
                // ======== DEBUG: SIKERES BEJELENTKEZÉS - TÖRLENDŐ ÉLES VERZIÓBAN ========
                System.Diagnostics.Debug.WriteLine($"DEBUG: Sikeres bejelentkezés - Felhasználó: {user.Name} ({user.Email})");
                // ======== DEBUG VÉGE ========
                
                // Store current user in a static property or service
                CurrentUserService.CurrentUser = user;
                _navigationService.NavigateTo<MainWindow>();
            }
            else
            {
                // ======== DEBUG: SIKERTELEN BEJELENTKEZÉS - TÖRLENDŐ ÉLES VERZIÓBAN ========
                System.Diagnostics.Debug.WriteLine("DEBUG: Sikertelen bejelentkezés - Hibás email vagy jelszó");
                // ======== DEBUG VÉGE ========
                
                ErrorMessage = "Invalid email or password.";
            }
        }
        catch (Exception ex)
        {
            // ======== DEBUG: HIBA - TÖRLENDŐ ÉLES VERZIÓBAN ========
            System.Diagnostics.Debug.WriteLine($"DEBUG: Bejelentkezési hiba: {ex.Message}");
            System.Diagnostics.Debug.WriteLine($"DEBUG: Belső hiba: {ex.InnerException?.Message}");
            // ======== DEBUG VÉGE ========
            
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
