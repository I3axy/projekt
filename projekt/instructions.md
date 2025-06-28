# Film Management WPF Application – Detailed Project Specification for GitHub Copilot

## Project Overview

Create a WPF desktop application in C# (.NET 6+) that connects to an **existing** SQL Server database named `movies` (already created and managed in SSMS). Skip any schema creation—assume the tables (`Users`, `Movies`, `Actors`, `Genres`, `MovieActors`, `MovieGenres`, `Ratings`, `UserRatings`) are in place.

## Application Requirements

### 1. Database Connection

* Use a connection string pointing to the existing `movies` database in SSMS.
* Configure EF Core `DbContext` to reference the current schema (no migrations to create or drop the database).

### 2. User Authentication

* **Login Screen**:

  * Fields: Email, Password
  * Validate non-empty, email format.
  * Call authentication service against the `Users` table.
  * On failure, display error; on success, navigate to Main UI.
* **Logout**:

  * Button in top menu returns to Login Screen.

### 3. Main Interface Layout

* **Top Menu (Tabs or Ribbon)**:

  * Logout
  * Users
  * Movies
  * Actors
  * Statistics
* **Back Button**:

  * Bottom-left corner, navigates to previous view (inactive on Login).

### 4. CRUD Views

#### Users View

* **Grid**: Email, Name, Tel
* **Search**: filter by Email/Name
* **Add**: Opens modal to insert into `Users`
* **Delete**: Remove selected user
* **Details** (double-click): show personal data plus list of rated movies from `UserRatings` (with star ratings)

#### Movies View

* **Grid**: Title, ReleaseDate, Duration, AverageRating (computed from `UserRatings`)
* **Search**: filter by Title/Genre
* **Add**: modal to insert into `Movies`
* **Delete**: remove selected entry
* **Details**: show synopsis, list of `MovieActors`, and user ratings

#### Actors View

* **Grid**: FullName, BirthDate, Nationality
* **Search**: filter by name/nationality
* **Add** / **Delete** -> `Actors` table
* **Details**: filmography via `MovieActors`

### 5. Statistics Dialog

* Triggered by the Statistics menu
* Options (up to 5):

  1. Top 5 Most Viewed Movies
  2. Shortest & Longest by Duration
  3. Top 5 Highest Rated
  4. Actor with Most Appearances
  5. Average Rating per Genre
* Execute queries against the existing tables and display results in a dialog grid.

## Technical Details

* **MVVM**: Models from EF Core DbContext (no database creation code), ViewModels handle commands.
* **EF Core**: Use `DbContext` against the `movies` database without migrations for creation.
* **Views**: WPF/XAML with `ContentControl` navigation or `NavigationService`.
* **Commands**: `ICommand` implementations for buttons.
* **Validation**: `IDataErrorInfo` or FluentValidation for form inputs.
* **Connection**: Place connection string in `appsettings.json` or `App.config`, pointing to SSMS server and `movies` DB.

---

*This revised spec instructs Copilot to scaffold the app against an existing SQL Server database, omitting any create/drop database steps.*
