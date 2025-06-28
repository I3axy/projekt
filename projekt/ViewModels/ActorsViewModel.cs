using System.Collections.ObjectModel;
using System.Windows.Input;
using Microsoft.EntityFrameworkCore;
using projekt.Commands;
using projekt.Data;
using projekt.Models;
using projekt.Views;

namespace projekt.ViewModels;

public class ActorsViewModel : BaseViewModel
{
    private readonly MoviesDbContext _context;
    private ObservableCollection<Actor> _actors = new();
    private Actor? _selectedActor;
    private string _searchText = string.Empty;

    public ActorsViewModel(MoviesDbContext context)
    {
        _context = context;
        
        AddCommand = new RelayCommand(AddActor);
        DeleteCommand = new RelayCommand(DeleteActor, () => SelectedActor != null);
        SearchCommand = new RelayCommand(async () => await SearchAsync());
        
        LoadActorsAsync();
    }

    public ObservableCollection<Actor> Actors
    {
        get => _actors;
        set => SetProperty(ref _actors, value);
    }

    public Actor? SelectedActor
    {
        get => _selectedActor;
        set => SetProperty(ref _selectedActor, value);
    }

    public string SearchText
    {
        get => _searchText;
        set => SetProperty(ref _searchText, value);
    }

    public ICommand AddCommand { get; }
    public ICommand DeleteCommand { get; }
    public ICommand SearchCommand { get; }

    private async void LoadActorsAsync()
    {
        var actors = await _context.Actors.ToListAsync();
        Actors = new ObservableCollection<Actor>(actors);
    }

    private async Task SearchAsync()
    {
        IQueryable<Actor> query = _context.Actors;
        
        if (!string.IsNullOrWhiteSpace(SearchText))
        {
            query = query.Where(a => a.FullName.Contains(SearchText) || 
                                   (a.Nationality != null && a.Nationality.Contains(SearchText)));
        }
        
        var actors = await query.ToListAsync();
        Actors = new ObservableCollection<Actor>(actors);
    }

    private void AddActor()
    {
        // Show add actor dialog
        var addActorWindow = new AddActorWindow();
        if (addActorWindow.ShowDialog() == true)
        {
            LoadActorsAsync();
        }
    }

    private async void DeleteActor()
    {
        if (SelectedActor != null)
        {
            _context.Actors.Remove(SelectedActor);
            await _context.SaveChangesAsync();
            Actors.Remove(SelectedActor);
        }
    }
}
