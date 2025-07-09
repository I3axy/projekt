using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Security.Cryptography;
using System.Text;

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
    
    // ======== HOZZÁADVA: Password property UI szerkesztéshez ========
    [NotMapped]
    private string? _passwordInput;
    
    [NotMapped]
    public string Password
    {
        get => _passwordInput ?? "••••••••"; // Ha nincs input, csillagokat mutat
        set
        {
            if (!string.IsNullOrEmpty(value) && value != "••••••••")
            {
                _passwordInput = value;
                PasswordHash = HashPassword(value);
            }
        }
    }
    
    private static string HashPassword(string password)
    {
        using var sha256 = SHA256.Create();
        var hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
        return Convert.ToHexString(hashedBytes);
    }
    // ======== HOZZÁADÁS VÉGE ========
    
    // Navigation properties
    public virtual ICollection<UserRating> UserRatings { get; set; } = new List<UserRating>();
}
