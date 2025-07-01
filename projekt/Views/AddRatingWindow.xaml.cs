using System.Windows;
using Microsoft.EntityFrameworkCore;
using projekt.Data;
using projekt.Models;

namespace projekt.Views;

public partial class AddRatingWindow : Window
{
    private readonly MoviesDbContext _context;
    private readonly int _movieId;

    public AddRatingWindow(int movieId)
    {
        InitializeComponent();
        _movieId = movieId;
        _context = ((App)Application.Current).GetDbContext();
        
        LoadUsers();
    }

    private async void LoadUsers()
    {
        try
        {
            // Betöltjük azokat a felhasználókat, akik még nem értékelték ezt a filmet
            var usersWithoutRating = await _context.Users
                .Where(u => !_context.UserRatings.Any(ur => ur.UserID == u.UserID && ur.MovieID == _movieId))
                .ToListAsync();
            
            UserComboBox.ItemsSource = usersWithoutRating;
            
            if (usersWithoutRating.Any())
            {
                UserComboBox.SelectedIndex = 0;
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Hiba a felhasználók betöltése során: {ex.Message}");
            MessageBox.Show("Error loading users.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }

    private async void SaveButton_Click(object sender, RoutedEventArgs e)
    {
        try
        {
            if (UserComboBox.SelectedItem is User selectedUser)
            {
                var rating = new UserRating
                {
                    UserID = selectedUser.UserID,
                    MovieID = _movieId,
                    Rating = (byte)RatingSlider.Value,
                    RatedAt = DateTime.Now
                };

                _context.UserRatings.Add(rating);
                await _context.SaveChangesAsync();

                DialogResult = true;
                Close();
            }
            else
            {
                MessageBox.Show("Please select a user.", "Validation Error", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Hiba a rating mentése során: {ex.Message}");
            MessageBox.Show("Error saving rating.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }

    private void CancelButton_Click(object sender, RoutedEventArgs e)
    {
        DialogResult = false;
        Close();
    }
}
