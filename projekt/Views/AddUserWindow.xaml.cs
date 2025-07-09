using System.Windows;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using projekt.Data;
using projekt.Models;
using projekt.Services;
using projekt.ViewModels;

namespace projekt.Views;

public partial class AddUserWindow : Window
{
    private readonly MoviesDbContext? _context;
    private readonly IAuthenticationService? _authService;

    public AddUserWindow()
    {
        InitializeComponent();
        
        // Get services from DI container
        if (System.Windows.Application.Current is App app && app.Services != null)
        {
            _context = app.Services.GetRequiredService<MoviesDbContext>();
            _authService = app.Services.GetRequiredService<IAuthenticationService>();
        }
    }

    private async void SaveButton_Click(object sender, RoutedEventArgs e)
    {
        // Ellenőrizzük, hogy a szolgáltatások inicializálódtak-e
        if (_context == null || _authService == null)
        {
            MessageBox.Show("Services not initialized properly.", "Error", 
                          MessageBoxButton.OK, MessageBoxImage.Error);
            return;
        }

        // Validáció - kötelező mezők ellenőrzése
        if (string.IsNullOrWhiteSpace(EmailTextBox.Text))
        {
            MessageBox.Show("Email field is required.", "Validation Error", 
                          MessageBoxButton.OK, MessageBoxImage.Warning);
            EmailTextBox.Focus();
            return;
        }

        if (string.IsNullOrWhiteSpace(PasswordBox.Password))
        {
            MessageBox.Show("Password field is required.", "Validation Error", 
                          MessageBoxButton.OK, MessageBoxImage.Warning);
            PasswordBox.Focus();
            return;
        }

        // Email formátum ellenőrzése
        if (!IsValidEmail(EmailTextBox.Text.Trim()))
        {
            MessageBox.Show("Please enter a valid email address.", "Validation Error", 
                          MessageBoxButton.OK, MessageBoxImage.Warning);
            EmailTextBox.Focus();
            return;
        }

        try
        {
            // Ellenőrizzük, hogy létezik-e már ilyen email
            var existingUser = await _context.Users.FirstOrDefaultAsync(u => u.Email == EmailTextBox.Text.Trim());
            if (existingUser != null)
            {
                MessageBox.Show("A user with this email address already exists.", "Validation Error", 
                              MessageBoxButton.OK, MessageBoxImage.Warning);
                EmailTextBox.Focus();
                return;
            }

            var user = new User
            {
                Email = EmailTextBox.Text.Trim(),
                Name = string.IsNullOrWhiteSpace(NameTextBox.Text) ? EmailTextBox.Text.Trim() : NameTextBox.Text.Trim(),
                Tel = string.IsNullOrWhiteSpace(PhoneTextBox.Text) ? null : PhoneTextBox.Text.Trim(),
                PasswordHash = _authService.HashPassword(PasswordBox.Password)
            };

            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            // Refresh statistics in MainViewModel
            if (System.Windows.Application.Current.MainWindow?.DataContext is MainViewModel mainViewModel)
            {
                await mainViewModel.RefreshStatisticsAsync();
            }

            MessageBox.Show("User added successfully!", "Success", 
                          MessageBoxButton.OK, MessageBoxImage.Information);

            DialogResult = true;
            Close();
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Error saving user: {ex.Message}", "Error", 
                          MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }

    private static bool IsValidEmail(string email)
    {
        try
        {
            var addr = new System.Net.Mail.MailAddress(email);
            return addr.Address == email;
        }
        catch
        {
            return false;
        }
    }

    private void CancelButton_Click(object sender, RoutedEventArgs e)
    {
        DialogResult = false;
        Close();
    }
}
