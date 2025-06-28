# Build és Futtatás Útmutató

## Visual Studio Community Edition-ben:

### 1. Előkészületek
1. Nyissa meg a **projekt.sln** fájlt Visual Studio-ban
2. Győződjön meg róla, hogy a **projekt** project van beállítva startup project-ként (jobb klikk a projekt nevén → "Set as Startup Project")

### 2. NuGet csomagok
1. **Tools** → **NuGet Package Manager** → **Manage NuGet Packages for Solution**
2. Kattintson a **Restore** gombra (ha szükséges)

### 3. Build
1. **Build** → **Build Solution** (vagy Ctrl+Shift+B)
2. Várja meg, hogy a build sikeresen befejeződjön

### 4. Adatbázis beállítás
Az adatbázis már létezik és fel van töltve a Microsoft SQL Server Management Studio-ban.

**SSMS beállítások ellenőrzése:**
1. **Nyissa meg SQL Server Management Studio-t**
2. **Kapcsolódjon a szerverhez** - próbálja ezeket sorban:
   - Server name: `(local)` vagy `.` vagy `localhost`
   - Authentication: `Windows Authentication`
   - Ha ez nem működik, próbálja: `(localdb)\MSSQLLocalDB`

3. **Ellenőrizze, hogy létezik-e a `movies` adatbázis:**
   - A bal oldali Object Explorer-ben keresse a `movies` adatbázist
   - Ha nincs meg, importálja a `script.sql` fájlt

4. **SQL Server konfigurációja:**
   - **SQL Server Configuration Manager** megnyitása
   - **SQL Server Services** → Ellenőrizze, hogy fut-e az SQL Server szolgáltatás
   - **SQL Server Network Configuration** → **Protocols** → Engedélyezze a **TCP/IP**-t

5. **Tesztfelhasználók hozzáadása:**
   - Futtassa a `test_users.sql` script-et az SSMS-ben

**Kapcsolati karakterlánc beállítása:**
Az `App.config` fájlban próbálja ezeket sorban:

```xml
<!-- Opció 1 - Az Ön gépe alapján (DESKTOP-PINKR53\SQLEXPRESS) -->
<add name="DefaultConnection" connectionString="Data Source=DESKTOP-PINKR53\SQLEXPRESS;Initial Catalog=movies;Integrated Security=True"/>

<!-- Opció 2 - Általános SQLEXPRESS instance -->
<add name="DefaultConnection" connectionString="Data Source=.\SQLEXPRESS;Initial Catalog=movies;Integrated Security=True"/>

<!-- Opció 3 - Local SQL Server -->
<add name="DefaultConnection" connectionString="Data Source=.;Initial Catalog=movies;Integrated Security=True"/>

<!-- Opció 4 - LocalDB -->
<add name="DefaultConnection" connectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=movies;Integrated Security=True"/>
```

### 5. Futtatás
1. **Debug** → **Start Debugging** (vagy F5)
2. Vagy **Debug** → **Start Without Debugging** (Ctrl+F5)

## Bejelentkezés
Az alkalmazás a `Users` táblában található felhasználókkal működik.

**EGYSZERŰ TESZTFELHASZNÁLÓ:**
- **Email**: test@test.com
- **Jelszó**: password123

**További tesztfelhasználók (test_users.sql script futtatása után):**
- **Email**: admin@test.com / **Jelszó**: password123
- **Email**: user1@test.com / **Jelszó**: password123
- **Email**: user2@test.com / **Jelszó**: password123

**Ha még nincsenek tesztfelhasználók az adatbázisban:**
- Futtassa a **test_users.sql** script-et az SSMS-ben
- Vagy használja a meglévő felhasználókat az adatbázisból

## Hibaelhárítás

### **Adatbázis kapcsolat hiba (mint a képen):**
1. **SSMS-ben ellenőrizze:**
   - Tud-e csatlakozni ugyanazzal a server névvel mint az `appsettings.json`-ban
   - A `movies` adatbázis létezik és elérhető
   
2. **SQL Server szolgáltatások:**
   - Windows + R → `services.msc`
   - Keresse: `SQL Server (MSSQLSERVER)` vagy `SQL Server (SQLEXPRESS)`
   - Ellenőrizze, hogy **Running** állapotban van
   
3. **Kapcsolati karakterlánc módosítása:**
   - Az `appsettings.json` fájlban próbálja a fenti opciókat
   - Használja ugyanazt a server nevet, amivel az SSMS-ben kapcsolódik

### **Egyéb hibák:**
- **Build sikertelen**: Ellenőrizze, hogy a .NET 8.0 SDK telepítve van
- **NuGet csomagok hiányoznak**: Tools → NuGet Package Manager → Restore
- **LoginWindow hiba**: 
  - Állítsa le a debuggert (Shift+F5)
  - Tiszta build: Build → Clean Solution, majd Build → Rebuild Solution
- **XAML/WPF hibák**: Gyakran a projekt tiszta újrabuildje megoldja őket
