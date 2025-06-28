using System.Windows;
using System.Windows.Controls;
using projekt.ViewModels;

namespace projekt.Views;

public partial class LoginWindow : Window
{
    public LoginWindow()
    {
        InitializeComponent();
    }

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
}
