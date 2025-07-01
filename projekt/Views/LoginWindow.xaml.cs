using System.Windows;
using System.Windows.Controls;
using projekt.ViewModels;
using projekt.Data;
using Microsoft.EntityFrameworkCore;

namespace projekt.Views;

public partial class LoginWindow : Window
{
    public LoginWindow()
    {
        InitializeComponent();
        
        // ======== DEBUG: FELHASZNÁLÓK KIÍRATÁSA - TÖRLENDŐ ÉLES VERZIÓBAN ========
        _ = LoadAndDisplayUsersAsync();
        // ======== DEBUG VÉGE ========
    }
    
    // ======== DEBUG METÓDUS - TÖRLENDŐ ÉLES VERZIÓBAN ========
    private async Task LoadAndDisplayUsersAsync()
    {
        try
        {
            System.Diagnostics.Debug.WriteLine("=== DEBUG: ADATBÁZIS FELHASZNÁLÓK ===");
            
            using var context = new MoviesDbContext();
            var users = await context.Users.ToListAsync();
            
            System.Diagnostics.Debug.WriteLine($"Összesen {users.Count} felhasználó az adatbázisban:");
            System.Diagnostics.Debug.WriteLine("");
            
            foreach (var user in users)
            {
                System.Diagnostics.Debug.WriteLine($"Email: {user.Email}");
                System.Diagnostics.Debug.WriteLine($"Név: {user.Name}");
                System.Diagnostics.Debug.WriteLine($"Jelszó hash: {user.PasswordHash}");
                System.Diagnostics.Debug.WriteLine($"Tel: {user.Tel ?? "nincs"}");
                System.Diagnostics.Debug.WriteLine("---");
            }
            
            System.Diagnostics.Debug.WriteLine("=== DEBUG VÉGE ===");
            System.Diagnostics.Debug.WriteLine("");
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"DEBUG HIBA: Nem sikerült betölteni a felhasználókat: {ex.Message}");
            System.Diagnostics.Debug.WriteLine($"Connection string próbálkozás: {ex.InnerException?.Message}");
            System.Diagnostics.Debug.WriteLine($"StackTrace: {ex.StackTrace}");
        }
    }
    // ======== DEBUG METÓDUS VÉGE ========

    private void PasswordBox_PasswordChanged(object sender, RoutedEventArgs e)
    {
        try
        {
            if (DataContext is LoginViewModel viewModel && sender is PasswordBox passwordBox)
            {
                viewModel.Password = passwordBox.Password;
            }
        }
        catch (Exception ex)
        {
            // Handle silently for now
            System.Diagnostics.Debug.WriteLine($"PasswordBox error: {ex.Message}");
        }
    }

    private void TogglePasswordVisibility_Click(object sender, RoutedEventArgs e)
    {
        try
        {
            if (DataContext is LoginViewModel viewModel)
            {
                viewModel.IsPasswordVisible = !viewModel.IsPasswordVisible;
                
                // Sync password between PasswordBox and TextBox
                if (viewModel.IsPasswordVisible)
                {
                    // Show password as text
                    var passwordTextBox = this.FindName("PasswordTextBox") as TextBox;
                    var passwordBox = this.FindName("PasswordBox") as PasswordBox;
                    
                    if (passwordTextBox != null && passwordBox != null)
                    {
                        passwordTextBox.Text = passwordBox.Password;
                        passwordTextBox.Focus();
                        passwordTextBox.CaretIndex = passwordTextBox.Text.Length;
                    }
                }
                else
                {
                    // Hide password as dots
                    var passwordTextBox = this.FindName("PasswordTextBox") as TextBox;
                    var passwordBox = this.FindName("PasswordBox") as PasswordBox;
                    
                    if (passwordTextBox != null && passwordBox != null)
                    {
                        passwordBox.Password = passwordTextBox.Text;
                        passwordBox.Focus();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Toggle password visibility error: {ex.Message}");
        }
    }
}
