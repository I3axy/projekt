using System.Security.Cryptography;
using System.Text;
using Microsoft.EntityFrameworkCore;
using projekt.Data;
using projekt.Models;

namespace projekt.Services;

public interface IAuthenticationService
{
    Task<User?> AuthenticateAsync(string email, string password);
    string HashPassword(string password);
    bool VerifyPassword(string password, string hash);
}

public class AuthenticationService : IAuthenticationService
{
    private readonly MoviesDbContext _context;

    public AuthenticationService(MoviesDbContext context)
    {
        _context = context;
    }

    public async Task<User?> AuthenticateAsync(string email, string password)
    {
        // ======== DEBUG: HITELESÍTÉSI FOLYAMAT - TÖRLENDŐ ÉLES VERZIÓBAN ========
        System.Diagnostics.Debug.WriteLine($"DEBUG AuthService: Hitelesítés indítása - Email: {email}");
        // ======== DEBUG VÉGE ========
        
        var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == email);
        
        // ======== DEBUG: FELHASZNÁLÓ KERESÉS - TÖRLENDŐ ÉLES VERZIÓBAN ========
        if (user == null)
        {
            System.Diagnostics.Debug.WriteLine($"DEBUG AuthService: Nincs felhasználó ezzel az emaillel: {email}");
        }
        else
        {
            System.Diagnostics.Debug.WriteLine($"DEBUG AuthService: Felhasználó megtalálva: {user.Name}");
            System.Diagnostics.Debug.WriteLine($"DEBUG AuthService: Tárolt jelszó: {user.PasswordHash}");
            System.Diagnostics.Debug.WriteLine($"DEBUG AuthService: Beírt jelszó: {password}");
            
            // ======== IDEIGLENESEN KIKAPCSOLVA: HASH ALAPÚ JELSZÓ ELLENŐRZÉS ========
            // var inputHash = HashPassword(password);
            // System.Diagnostics.Debug.WriteLine($"DEBUG AuthService: Beírt jelszó hash: {inputHash}");
            // System.Diagnostics.Debug.WriteLine($"DEBUG AuthService: Hash egyezés: {inputHash == user.PasswordHash}");
            // ======== HASH ELLENŐRZÉS VÉGE ========
            
            System.Diagnostics.Debug.WriteLine($"DEBUG AuthService: Egyszerű szöveg egyezés: {password == user.PasswordHash}");
        }
        // ======== DEBUG VÉGE ========
        
        // ======== IDEIGLENESEN MÓDOSÍTVA: EGYSZERŰ SZÖVEG ALAPÚ JELSZÓ ELLENŐRZÉS ========
        // Eredeti kód (hash alapú):
        // if (user == null || !VerifyPassword(password, user.PasswordHash))
        // Ideiglenes kód (egyszerű szöveg):
        if (user == null || user.PasswordHash != password)
        // ======== MÓDOSÍTÁS VÉGE ========
        {
            return null;
        }

        return user;
    }

    public string HashPassword(string password)
    {
        using var sha256 = SHA256.Create();
        var hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
        return Convert.ToHexString(hashedBytes);
    }

    public bool VerifyPassword(string password, string hash)
    {
        var hashedPassword = HashPassword(password);
        return hashedPassword == hash;
    }
}
