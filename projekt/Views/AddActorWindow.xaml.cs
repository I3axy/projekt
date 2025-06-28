using System.Windows;
using System.Windows.Controls;
using Microsoft.Extensions.DependencyInjection;
using projekt.Data;
using projekt.Models;

namespace projekt.Views;

public partial class AddActorWindow : Window
{
    private readonly MoviesDbContext _context;

    public AddActorWindow()
    {
        InitializeComponent();
        
        // Get context from DI container
        if (System.Windows.Application.Current is App app && app.Services != null)
        {
            _context = app.Services.GetRequiredService<MoviesDbContext>();
        }
    }

    private async void SaveButton_Click(object sender, RoutedEventArgs e)
    {
        if (string.IsNullOrWhiteSpace(FullNameTextBox.Text))
        {
            MessageBox.Show("Full Name is required.", "Validation Error", 
                          MessageBoxButton.OK, MessageBoxImage.Warning);
            return;
        }

        try
        {
            var actor = new Actor
            {
                FullName = FullNameTextBox.Text.Trim(),
                BirthDate = BirthDatePicker.SelectedDate,
                Nationality = NationalityTextBox.Text.Trim(),
                Gender = (GenderComboBox.SelectedItem as ComboBoxItem)?.Content?.ToString()
            };

            _context.Actors.Add(actor);
            await _context.SaveChangesAsync();

            DialogResult = true;
            Close();
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Error saving actor: {ex.Message}", "Error", 
                          MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }

    private void CancelButton_Click(object sender, RoutedEventArgs e)
    {
        DialogResult = false;
        Close();
    }
}
