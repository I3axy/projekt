using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace projekt.Models;

public class Rating
{
    [Key]
    public int RatingID { get; set; }
    
    public int? MovieID { get; set; }
    
    [StringLength(100)]
    public string? Source { get; set; }
    
    [Column(TypeName = "decimal(4,1)")]
    public decimal? Score { get; set; }
    
    [Column(TypeName = "decimal(4,1)")]
    public decimal? MaxScore { get; set; }
    
    public int? ReviewCount { get; set; }
    
    // Navigation properties
    [ForeignKey("MovieID")]
    public virtual Movie? Movie { get; set; }
}
