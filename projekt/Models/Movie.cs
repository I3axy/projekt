using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace projekt.Models;

public class Movie
{
    [Key]
    public int MovieID { get; set; }
    
    [Required]
    [StringLength(200)]
    public string Title { get; set; } = string.Empty;
    
    public DateTime? ReleaseDate { get; set; }
    
    public int? DurationMinutes { get; set; }
    
    [StringLength(50)]
    public string? Language { get; set; }
    
    public long? Budget { get; set; }
    
    public long? Revenue { get; set; }
    
    public string? Synopsis { get; set; }
    
    public int? ProducerID { get; set; }
    
    [Column(TypeName = "decimal(3,2)")]
    public decimal? AverageRating { get; set; }
    
    // Navigation properties
    public virtual Producer? Producer { get; set; }
    public virtual ICollection<MovieActor> MovieActors { get; set; } = new List<MovieActor>();
    public virtual ICollection<MovieGenre> MovieGenres { get; set; } = new List<MovieGenre>();
    public virtual ICollection<Rating> Ratings { get; set; } = new List<Rating>();
    public virtual ICollection<UserRating> UserRatings { get; set; } = new List<UserRating>();
}
