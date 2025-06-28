using System;
using System.Security.Cryptography;
using System.Text;

// Test hash generation
using var sha256 = SHA256.Create();
var hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes("password123"));
var hexHash = Convert.ToHexString(hashedBytes);

Console.WriteLine($"Password: password123");
Console.WriteLine($"HEX Hash: {hexHash}");
Console.WriteLine($"Expected: EF92B778BAFE771E89245B89ECBC08A44A4E166C06659C76A00C85A3FDC6C1F7");
Console.WriteLine($"Match: {hexHash == "EF92B778BAFE771E89245B89ECBC08A44A4E166C06659C76A00C85A3FDC6C1F7"}");
