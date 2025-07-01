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
    private bool _hasChanges = false; // ======== HOZZÁADVA ========

    public ActorsViewModel(MoviesDbContext context)
    {
        _context = context;
        
        AddCommand = new RelayCommand(AddActor);
        DeleteCommand = new RelayCommand(DeleteActor, () => SelectedActor != null);
        SearchCommand = new RelayCommand(async () => await SearchAsync());
        SaveCommand = new RelayCommand(async () => await SaveChangesAsync(), () => HasChanges); // ======== HOZZÁADVA ========
        
        Task.Run(async () => await LoadActorsAsync());
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

    private async Task LoadActorsAsync()
    {
        try
        {
            _context.ChangeTracker.Clear(); // Tisztítsuk meg a change trackert
            var actors = await _context.Actors.ToListAsync();
            Actors = new ObservableCollection<Actor>(actors);
            HasChanges = false; // Reset changes flag
        }
        catch (Exception)
        {
            // Handle error silently for now
            Actors = new ObservableCollection<Actor>();
        }
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

    private async void AddActor()
    {
        // Show add actor dialog
        var addActorWindow = new AddActorWindow();
        if (addActorWindow.ShowDialog() == true)
        {
            await LoadActorsAsync();
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

    // ======== HOZZÁADVA: SaveChangesAsync metódus színészekhez ========
    private async Task SaveChangesAsync()
    {
        try
        {
            System.Diagnostics.Debug.WriteLine("Színész mentés kezdése...");
            
            foreach (var actor in Actors)
            {
                var dbActor = await _context.Actors.FindAsync(actor.ActorID);
                if (dbActor != null)
                {
                    if (dbActor.FullName != actor.FullName)
                    {
                        System.Diagnostics.Debug.WriteLine($"Színész név változás: {dbActor.FullName} -> {actor.FullName}");
                        dbActor.FullName = actor.FullName;
                    }
                    if (dbActor.BirthDate != actor.BirthDate)
                    {
                        System.Diagnostics.Debug.WriteLine($"Születési dátum változás: {dbActor.BirthDate} -> {actor.BirthDate}");
                        dbActor.BirthDate = actor.BirthDate;
                    }
                    if (dbActor.Nationality != actor.Nationality)
                    {
                        System.Diagnostics.Debug.WriteLine($"Nemzetiség változás: {dbActor.Nationality} -> {actor.Nationality}");
                        dbActor.Nationality = actor.Nationality;
                    }
                    if (dbActor.Gender != actor.Gender)
                    {
                        System.Diagnostics.Debug.WriteLine($"Nem változás: {dbActor.Gender} -> {actor.Gender}");
                        dbActor.Gender = actor.Gender;
                    }
                }
            }
            
            var changes = await _context.SaveChangesAsync();
            System.Diagnostics.Debug.WriteLine($"Mentve {changes} színész változás az adatbázisba.");
            
            HasChanges = false;
            
            // Újratöltjük az adatokat
            LoadActorsAsync();
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine($"Hiba a színész mentés során: {ex.Message}");
            System.Diagnostics.Debug.WriteLine($"StackTrace: {ex.StackTrace}");
        }
    }
    // ======== HOZZÁADÁS VÉGE ========
}
