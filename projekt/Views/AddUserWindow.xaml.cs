using System.Windows;
using Microsoft.Extensions.DependencyInjection;
using projekt.Data;
using projekt.Models;
using projekt.Services;

namespace projekt.Views;

public partial class AddUserWindow : Window
{
    private readonly MoviesDbContext _context;
    private readonly IAuthenticationService _authService;

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
        if (string.IsNullOrWhiteSpace(EmailTextBox.Text) || 
            string.IsNullOrWhiteSpace(NameTextBox.Text))
        {
            MessageBox.Show("Email and Name are required fields.", "Validation Error", 
                          MessageBoxButton.OK, MessageBoxImage.Warning);
            return;
        }

        try
        {
            var user = new User
            {
                Email = EmailTextBox.Text.Trim(),
                Name = NameTextBox.Text.Trim(),
                Tel = PhoneTextBox.Text.Trim(),
                PasswordHash = _authService.HashPassword("password123") // Default password
            };

            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            DialogResult = true;
            Close();
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Error saving user: {ex.Message}", "Error", 
                          MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }

    private void CancelButton_Click(object sender, RoutedEventArgs e)
    {
        DialogResult = false;
        Close();
    }
}
