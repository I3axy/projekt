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

    public UsersViewModel(MoviesDbContext context)
    {
        _context = context;
        
        AddCommand = new RelayCommand(AddUser);
        DeleteCommand = new RelayCommand(DeleteUser, () => SelectedUser != null);
        SearchCommand = new RelayCommand(async () => await SearchAsync());
        
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

    public ICommand AddCommand { get; }
    public ICommand DeleteCommand { get; }
    public ICommand SearchCommand { get; }

    private async Task LoadUsersAsync()
    {
        try
        {
            var users = await _context.Users.ToListAsync();
            Users = new ObservableCollection<User>(users);
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
        }
    }
}
