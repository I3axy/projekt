using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace projekt.Models;

public class MovieGenre
{
    [Key, Column(Order = 0)]
    public int MovieID { get; set; }
    
    [Key, Column(Order = 1)]
    public int GenreID { get; set; }
    
    // Navigation properties
    [ForeignKey("MovieID")]
    public virtual Movie Movie { get; set; } = null!;
    
    [ForeignKey("GenreID")]
    public virtual Genre Genre { get; set; } = null!;
}
