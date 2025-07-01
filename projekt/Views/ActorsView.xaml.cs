using System.Windows.Controls;
using projekt.ViewModels;

namespace projekt.Views;

public partial class ActorsView : UserControl
{
    public ActorsView()
    {
        InitializeComponent();
    }

    // ======== HOZZÁADVA: Színész szerkesztési eseménykezelő ========
    private void DataGrid_CellEditEnding(object sender, DataGridCellEditEndingEventArgs e)
    {
        if (DataContext is ActorsViewModel viewModel)
        {
            System.Diagnostics.Debug.WriteLine("Színész cella szerkesztés befejezése - HasChanges = true");
            viewModel.HasChanges = true;
        }
    }
    // ======== HOZZÁADÁS VÉGE ========
}
