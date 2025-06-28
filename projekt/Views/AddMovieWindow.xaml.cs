using System.Windows;
using Microsoft.Extensions.DependencyInjection;
using projekt.Data;
using projekt.Models;

namespace projekt.Views;

public partial class AddMovieWindow : Window
{
    private readonly MoviesDbContext _context;

    public AddMovieWindow()
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
        if (string.IsNullOrWhiteSpace(TitleTextBox.Text))
        {
            MessageBox.Show("Title is required.", "Validation Error", 
                          MessageBoxButton.OK, MessageBoxImage.Warning);
            return;
        }

        try
        {
            int? duration = null;
            if (!string.IsNullOrWhiteSpace(DurationTextBox.Text) && 
                int.TryParse(DurationTextBox.Text, out int durationValue))
            {
                duration = durationValue;
            }

            var movie = new Movie
            {
                Title = TitleTextBox.Text.Trim(),
                ReleaseDate = ReleaseDatePicker.SelectedDate,
                DurationMinutes = duration,
                Synopsis = SynopsisTextBox.Text.Trim()
            };

            _context.Movies.Add(movie);
            await _context.SaveChangesAsync();

            DialogResult = true;
            Close();
        }
        catch (Exception ex)
        {
            MessageBox.Show($"Error saving movie: {ex.Message}", "Error", 
                          MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }

    private void CancelButton_Click(object sender, RoutedEventArgs e)
    {
        DialogResult = false;
        Close();
    }
}
