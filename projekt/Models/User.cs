using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace projekt.Models;

public class User
{
    [Key]
    public int UserID { get; set; }
    
    [Required]
    [StringLength(255)]
    public string Email { get; set; } = string.Empty;
    
    [Required]
    [StringLength(100)]
    public string Name { get; set; } = string.Empty;
    
    [Required]
    [StringLength(255)]
    public string PasswordHash { get; set; } = string.Empty;
    
    [StringLength(20)]
    public string? Tel { get; set; }
    
    // Navigation properties
    public virtual ICollection<UserRating> UserRatings { get; set; } = new List<UserRating>();
}
