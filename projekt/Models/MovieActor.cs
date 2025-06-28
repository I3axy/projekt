using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace projekt.Models;

public class MovieActor
{
    [Key, Column(Order = 0)]
    public int MovieID { get; set; }
    
    [Key, Column(Order = 1)]
    public int ActorID { get; set; }
    
    [StringLength(100)]
    public string? RoleName { get; set; }
    
    public bool? IsLead { get; set; }
    
    // Navigation properties
    [ForeignKey("MovieID")]
    public virtual Movie Movie { get; set; } = null!;
    
    [ForeignKey("ActorID")]
    public virtual Actor Actor { get; set; } = null!;
}
