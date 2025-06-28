using System.ComponentModel.DataAnnotations;

namespace projekt.Models;

public class Actor
{
    [Key]
    public int ActorID { get; set; }
    
    [Required]
    [StringLength(100)]
    public string FullName { get; set; } = string.Empty;
    
    public DateTime? BirthDate { get; set; }
    
    [StringLength(100)]
    public string? Nationality { get; set; }
    
    [StringLength(10)]
    public string? Gender { get; set; }
    
    // Navigation properties
    public virtual ICollection<MovieActor> MovieActors { get; set; } = new List<MovieActor>();
}
