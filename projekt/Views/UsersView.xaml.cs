using System.Windows.Controls;
using projekt.ViewModels;

namespace projekt.Views;

public partial class UsersView : UserControl
{
    public UsersView()
    {
        InitializeComponent();
    }

    // ======== JAVÍTVA: Szerkesztési eseménykezelők ========
    private void DataGrid_BeginningEdit(object sender, DataGridBeginningEditEventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("Szerkesztés kezdése...");
    }
    
    private void DataGrid_CellEditEnding(object sender, DataGridCellEditEndingEventArgs e)
    {
        if (DataContext is UsersViewModel viewModel)
        {
            System.Diagnostics.Debug.WriteLine("Cella szerkesztés befejezése - HasChanges = true");
            viewModel.HasChanges = true;
        }
    }
    // ======== JAVÍTÁS VÉGE ========
}
