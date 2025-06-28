# Film Management WPF Application

Ez egy teljes funkcionalitású film adatbázis kezelő WPF alkalmazás, amely egy meglévő SQL Server `movies` adatbázishoz csatlakozik.

## Követelmények

- .NET 8.0 SDK
- Visual Studio 2022 Community Edition vagy újabb
- SQL Server (LocalDB vagy teljes verzió)
- **Meglévő `movies` adatbázis** - már létezik és fel van töltve az SSMS-ben

## Telepítés és futtatás

1. **Adatbázis ellenőrzés:**
   - A `movies` adatbázis már létezik és fel van töltve a Microsoft SQL Server Management Studio-ban
   - A `script.sql` fájl ebből az adatbázisból lett exportálva
   - Ellenőrizze, hogy elérhető-e az adatbázis az SSMS-ben

2. **Kapcsolati karakterlánc:**
   - Az `appsettings.json` fájlban állítsa be a helyes kapcsolati karakterláncot
   - Alapértelmezett LocalDB: `Server=(localdb)\\mssqllocaldb;Database=movies;Trusted_Connection=true;TrustServerCertificate=true;`
   - Teljes SQL Server: `Server=.;Database=movies;Trusted_Connection=true;TrustServerCertificate=true;`
   - **Módosítsa a Server részt** a saját SQL Server példányának megfelelően

3. **Tesztfelhasználók (opcionális):**
   - Ha szeretne tesztfelhasználókat, futtassa a `test_users.sql` script-et az SSMS-ben
   - Ez hozzáad 3 teszt felhasználót alapértelmezett jelszavakkal

4. **Projekt futtatása:**
   - Nyissa meg a `projekt.sln` fájlt Visual Studio-ban
   - Build > Build Solution (Ctrl+Shift+B)
   - Debug > Start Debugging (F5)

## Funkciók

### Bejelentkezés
- Email és jelszó alapú hitelesítés
- Alapértelmezett felhasználók az adatbázisban

### Főmenü
- **Users**: Felhasználók kezelése (hozzáadás, törlés, keresés)
- **Movies**: Filmek kezelése (hozzáadás, törlés, keresés)
- **Actors**: Színészek kezelése (hozzáadás, törlés, keresés)
- **Statistics**: Statisztikai jelentések

### Statisztikák
1. Top 5 legtöbbet értékelt film
2. Legrövidebb és leghosszabb filmek
3. Top 5 legmagasabban értékelt film
4. Legtöbb filmben szereplő színész
5. Átlagos értékelés műfaj szerint

## Technológiák

- **WPF** - Felhasználói felület
- **Entity Framework Core** - Adatbázis hozzáférés
- **MVVM Pattern** - Architektúra
- **Dependency Injection** - Szolgáltatások kezelése
- **SQL Server** - Adatbázis

## Projekt struktúra

```
projekt/
├── Models/           # Entity Framework modellek
├── ViewModels/       # MVVM ViewModellek
├── Views/           # WPF ablakok és UserControlek
├── Services/        # Üzleti logika szolgáltatások
├── Commands/        # ICommand implementációk
├── Converters/      # XAML konverterek
└── Data/           # DbContext
```

## Hibaelhárítás

- **Adatbázis kapcsolat hiba**: 
  - Ellenőrizze a kapcsolati karakterláncot az `appsettings.json` fájlban
  - Győződjön meg róla, hogy fut az SQL Server és elérhető a `movies` adatbázis
  - Tesztelje a kapcsolatot az SSMS-ben
- **Build hibák**: Győződjön meg róla, hogy a .NET 8.0 SDK telepítve van
- **NuGet csomagok**: Restore NuGet packages (Tools > NuGet Package Manager > Restore)
- **Bejelentkezési probléma**: Ellenőrizze, hogy vannak-e felhasználók a `Users` táblában, vagy futtassa a `test_users.sql` script-et
