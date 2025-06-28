using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Microsoft.Extensions.DependencyInjection;
using projekt.ViewModels;

namespace projekt
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            
            // Set DataContext to MainViewModel from DI container
            if (System.Windows.Application.Current is App app && app.Services != null)
            {
                var mainViewModel = app.Services.GetService<MainViewModel>();
                DataContext = mainViewModel;
            }
        }
    }
}