using System.Configuration;
using System.Data;
using System.IO;
using System.Windows;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using projekt.Data;
using projekt.Services;
using projekt.ViewModels;
using projekt.Views;
using AppConfigManager = System.Configuration.ConfigurationManager;

namespace projekt
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        private IHost? _host;
        
        public IServiceProvider? Services => _host?.Services;

        protected override void OnStartup(StartupEventArgs e)
        {
            var builder = Host.CreateApplicationBuilder();

            // Database - use App.config connection string
            string connectionString = AppConfigManager.ConnectionStrings["DefaultConnection"]?.ConnectionString 
                ?? "Data Source=.;Initial Catalog=movies;Integrated Security=True";
            
            builder.Services.AddDbContext<MoviesDbContext>(options =>
                options.UseSqlServer(connectionString));

            // Services
            builder.Services.AddSingleton<INavigationService, NavigationService>();
            builder.Services.AddScoped<IAuthenticationService, AuthenticationService>();

            // ViewModels
            builder.Services.AddTransient<LoginViewModel>();
            builder.Services.AddTransient<MainViewModel>();
            builder.Services.AddTransient<UsersViewModel>();
            builder.Services.AddTransient<MoviesViewModel>();
            builder.Services.AddTransient<ActorsViewModel>();
            builder.Services.AddTransient<StatisticsViewModel>();

            _host = builder.Build();

            base.OnStartup(e);

            // Initialize and show login window after base startup
            try
            {
                var loginWindow = new LoginWindow();
                var loginViewModel = _host.Services.GetRequiredService<LoginViewModel>();
                loginWindow.DataContext = loginViewModel;
                loginWindow.Show();
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show($"Application startup error: {ex.Message}\n\nDetails: {ex.InnerException?.Message}", 
                    "Startup Error", MessageBoxButton.OK, MessageBoxImage.Error);
                Shutdown();
            }
        }

        protected override void OnExit(ExitEventArgs e)
        {
            if (_host != null)
            {
                _host.StopAsync().Wait();
                _host.Dispose();
            }
            base.OnExit(e);
        }

        // ======== HOZZÁADVA: GetDbContext metódus ========
        public MoviesDbContext GetDbContext()
        {
            if (_host?.Services == null)
                throw new InvalidOperationException("Services not initialized");
                
            return _host.Services.GetRequiredService<MoviesDbContext>();
        }
        // ======== HOZZÁADÁS VÉGE ========
    }
}
