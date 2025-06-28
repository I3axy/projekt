using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace projekt.Models;

public class UserRating
{
    [Key, Column(Order = 0)]
    public int UserID { get; set; }
    
    [Key, Column(Order = 1)]
    public int MovieID { get; set; }
    
    [Required]
    public byte Rating { get; set; }
    
    [Required]
    public DateTime RatedAt { get; set; }
    
    // Navigation properties
    [ForeignKey("UserID")]
    public virtual User User { get; set; } = null!;
    
    [ForeignKey("MovieID")]
    public virtual Movie Movie { get; set; } = null!;
}
