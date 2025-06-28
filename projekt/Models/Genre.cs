using System.ComponentModel.DataAnnotations;

namespace projekt.Models;

public class Genre
{
    [Key]
    public int GenreID { get; set; }
    
    [Required]
    [StringLength(50)]
    public string Name { get; set; } = string.Empty;
    
    // Navigation properties
    public virtual ICollection<MovieGenre> MovieGenres { get; set; } = new List<MovieGenre>();
}
