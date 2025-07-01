using System.Windows.Controls;
using projekt.ViewModels;

namespace projekt.Views;

public partial class MoviesView : UserControl
{
    public MoviesView()
    {
        InitializeComponent();
    }

    // ======== HOZZÁADVA: Film szerkesztési eseménykezelő ========
    private void DataGrid_CellEditEnding(object sender, DataGridCellEditEndingEventArgs e)
    {
        if (DataContext is MoviesViewModel viewModel)
        {
            System.Diagnostics.Debug.WriteLine("Film cella szerkesztés befejezése - HasChanges = true");
            viewModel.HasChanges = true;
        }
    }
    // ======== HOZZÁADÁS VÉGE ========
}
