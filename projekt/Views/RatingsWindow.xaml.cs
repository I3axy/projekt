using System.Windows;
using System.Windows.Controls;
using projekt.ViewModels;

namespace projekt.Views;

public partial class RatingsWindow : Window
{
    public RatingsWindow(int movieId, string movieTitle)
    {
        InitializeComponent();
        
        // ViewModel létrehozása és beállítása
        var context = ((App)Application.Current).GetDbContext();
        DataContext = new RatingsViewModel(context, movieId, movieTitle);
    }

    private void DataGrid_CellEditEnding(object sender, DataGridCellEditEndingEventArgs e)
    {
        if (DataContext is RatingsViewModel viewModel)
        {
            System.Diagnostics.Debug.WriteLine("Rating cella szerkesztés befejezése - HasChanges = true");
            viewModel.HasChanges = true;
        }
    }

    private void CloseButton_Click(object sender, RoutedEventArgs e)
    {
        this.Close();
    }
}

// Converter helper class
public static class BooleanConverters
{
    public static readonly System.Windows.Data.IValueConverter IsNotNull = 
        new IsNotNullConverter();
}

public class IsNotNullConverter : System.Windows.Data.IValueConverter
{
    public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
    {
        return value != null;
    }

    public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
    {
        throw new NotImplementedException();
    }
}
