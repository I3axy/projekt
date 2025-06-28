using System.ComponentModel.DataAnnotations;

namespace projekt.Models;

public class Producer
{
    [Key]
    public int ProducerID { get; set; }
    
    [Required]
    [StringLength(100)]
    public string FullName { get; set; } = string.Empty;
    
    [StringLength(100)]
    public string? Company { get; set; }
    
    [StringLength(100)]
    public string? Nationality { get; set; }
    
    // Navigation properties
    public virtual ICollection<Movie> Movies { get; set; } = new List<Movie>();
}
