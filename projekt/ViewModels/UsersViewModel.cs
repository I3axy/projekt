using System.Collections.ObjectModel;
using System.Windows.Input;
using Microsoft.EntityFrameworkCore;
using projekt.Commands;
using projekt.Data;
using projekt.Models;
using projekt.Views;

namespace projekt.ViewModels;

public class UsersViewModel : BaseViewModel
{
    private readonly MoviesDbContext _context;
    private ObservableCollection<User> _users = new();
    private User? _selectedUser;
    private string _searchText = string.Empty;
    private bool _hasChanges = false; // ======== HOZZÁADVA ========

    public UsersViewModel(MoviesDbContext context)
    {
        _context = context;
        
        AddCommand = new RelayCommand(AddUser);
        DeleteCommand = new RelayCommand(DeleteUser, () => SelectedUser != null);
        SearchCommand = new RelayCommand(async () => await SearchAsync());
        SaveCommand = new RelayCommand(async () => await SaveChangesAsync(), () => HasChanges); // ======== HOZZÁADVA ========
        
        Task.Run(async () => await LoadUsersAsync());
    }

    public ObservableCollection<User> Users
    {
        get => _users;
        set => SetProperty(ref _users, value);
    }

    public User? SelectedUser
    {
        get => _selectedUser;
        set => SetProperty(ref _selectedUser, value);
    }

    public string SearchText
    {
        get => _searchText;
        set => SetProperty(ref _searchText, value);
    }

    // ======== HOZZÁADVA: HasChanges tulajdonság ========
    public bool HasChanges
    {
        get => _hasChanges;
        set => SetProperty(ref _hasChanges, value);
    }
    // ======== HOZZÁADÁS VÉGE ========

    public ICommand AddCommand { get; }
    public ICommand DeleteCommand { get; }
    public ICommand SearchCommand { get; }
    public ICommand SaveCommand { get; } // ======== HOZZÁADVA ========

    private async Task LoadUsersAsync()
    {
        try
        {
            // ======== JAVÍTÁS: Context frissítése ========
            _context.ChangeTracker.Clear(); // Tisztítsuk meg a change trackert
            // ======== JAVÍTÁS VÉGE ========
            
            var users = await _context.Users.ToListAsync();
            Users = new ObservableCollection<User>(users);
            HasChanges = false; // Reset changes flag
        }
        catch (Exception)
        {
            // Handle error silently for now
            Users = new ObservableCollection<User>();
        }
    }

    private async Task SearchAsync()
    {
        IQueryable<User> query = _context.Users;
        
        if (!string.IsNullOrWhiteSpace(SearchText))
        {
            query = query.Where(u => u.Email.Contains(SearchText) || u.Name.Contains(SearchText));
        }
        
        var users = await query.ToListAsync();
        Users = new ObservableCollection<User>(users);
    }

    private async void AddUser()
    {
        // Show add user dialog
        var addUserWindow = new AddUserWindow();
        if (addUserWindow.ShowDialog() == true)
        {
            await LoadUsersAsync();
        }
    }

    private async void DeleteUser()
    {
        if (SelectedUser != null)
        {
            _context.Users.Remove(SelectedUser);
            await _context.SaveChangesAsync();
            Users.Remove(SelectedUser);
            
            // Refresh statistics in MainViewModel
            if (System.Windows.Application.Current.MainWindow?.DataContext is MainViewModel mainViewModel)
            {
                await mainViewModel.RefreshStatisticsAsync();
            }
        }
    }

    // ======== JAVÍTÁS: Egyszerűbb és működő SaveChangesAsync metódus ========
    private async Task SaveChangesAsync()
    {
        try
        {
            System.Diagnostics.Debug.WriteLine("Mentés kezdése...");
            
            // Az aktuális felhasználók adatainak mentése
            foreach (var user in Users)
            {
                // Keresd meg az adatbázisban a megfelelő felhasználót
                var dbUser = await _context.Users.FindAsync(user.UserID);
                if (dbUser != null)
                {
                    // Frissítsd az értékeket
                    if (dbUser.Email != user.Email)
                    {
                        System.Diagnostics.Debug.WriteLine($"Email változás: {dbUser.Email} -> {user.Email}");
                        dbUser.Email = user.Email;
                    }
                    if (dbUser.Name != user.Name)
                    {
                        System.Diagnostics.Debug.WriteLine($"Név változás: {dbUser.Name} -> {user.Name}");
                        dbUser.Name = user.Name;
                    }
                    if (dbUser.Tel != user.Tel)
                    {
                        System.Diagnostics.Debug.WriteLine($"Tel változás: {dbUser.Tel} -> {user.Tel}");
                        dbUser.Tel = user.Tel;
                    }
                    // ======== HOZZÁADVA: PasswordHash mentése ========
                    if (dbUser.PasswordHash != user.PasswordHash)
                    {
                        System.Diagnostics.Debug.WriteLine($"Jelszó változás a felhasználónál: {user.Email}");
                        dbUser.PasswordHash = user.PasswordHash;
                    }
                    // ======== HOZZÁADÁS VÉGE ========
                }
            }
            
            var changes = await _context.SaveChangesAsync();
            System.Diagnostics.Debug.WriteLine($"Mentve {changes} változás az adatbázisba.");
            
            HasChanges = false;
            
            // Újratöltjük az adatokat a változások megjelenítéséhez
            await LoadUsersAsync();
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Hiba a mentés során: {ex.Message}");
            System.Diagnostics.Debug.WriteLine($"StackTrace: {ex.StackTrace}");
        }
    }
    // ======== JAVÍTÁS VÉGE ========
}
