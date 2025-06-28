using Microsoft.EntityFrameworkCore;
using projekt.Models;
using AppConfigManager = System.Configuration.ConfigurationManager;

namespace projekt.Data;

public class MoviesDbContext : DbContext
{
    public MoviesDbContext() : base()
    {
    }

    public MoviesDbContext(DbContextOptions<MoviesDbContext> options) : base(options)
    {
    }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            string connectionString = AppConfigManager.ConnectionStrings["DefaultConnection"]?.ConnectionString 
                ?? "Data Source=.;Initial Catalog=movies;Integrated Security=True";
            optionsBuilder.UseSqlServer(connectionString);
        }
    }

    public DbSet<User> Users { get; set; }
    public DbSet<Movie> Movies { get; set; }
    public DbSet<Actor> Actors { get; set; }
    public DbSet<Genre> Genres { get; set; }
    public DbSet<Producer> Producers { get; set; }
    public DbSet<MovieActor> MovieActors { get; set; }
    public DbSet<MovieGenre> MovieGenres { get; set; }
    public DbSet<Rating> Ratings { get; set; }
    public DbSet<UserRating> UserRatings { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        // Configure composite keys
        modelBuilder.Entity<MovieActor>()
            .HasKey(ma => new { ma.MovieID, ma.ActorID });

        modelBuilder.Entity<MovieGenre>()
            .HasKey(mg => new { mg.MovieID, mg.GenreID });

        modelBuilder.Entity<UserRating>()
            .HasKey(ur => new { ur.UserID, ur.MovieID });

        // Configure table names to match database
        modelBuilder.Entity<User>().ToTable("Users");
        modelBuilder.Entity<Movie>().ToTable("movies");
        modelBuilder.Entity<Actor>().ToTable("actors");
        modelBuilder.Entity<Genre>().ToTable("genres");
        modelBuilder.Entity<Producer>().ToTable("producers");
        modelBuilder.Entity<MovieActor>().ToTable("movieactors");
        modelBuilder.Entity<MovieGenre>().ToTable("moviegenres");
        modelBuilder.Entity<Rating>().ToTable("ratings");
        modelBuilder.Entity<UserRating>().ToTable("UserRatings");

        // Configure relationships
        modelBuilder.Entity<MovieActor>()
            .HasOne(ma => ma.Movie)
            .WithMany(m => m.MovieActors)
            .HasForeignKey(ma => ma.MovieID);

        modelBuilder.Entity<MovieActor>()
            .HasOne(ma => ma.Actor)
            .WithMany(a => a.MovieActors)
            .HasForeignKey(ma => ma.ActorID);

        modelBuilder.Entity<MovieGenre>()
            .HasOne(mg => mg.Movie)
            .WithMany(m => m.MovieGenres)
            .HasForeignKey(mg => mg.MovieID);

        modelBuilder.Entity<MovieGenre>()
            .HasOne(mg => mg.Genre)
            .WithMany(g => g.MovieGenres)
            .HasForeignKey(mg => mg.GenreID);

        modelBuilder.Entity<UserRating>()
            .HasOne(ur => ur.User)
            .WithMany(u => u.UserRatings)
            .HasForeignKey(ur => ur.UserID);

        modelBuilder.Entity<UserRating>()
            .HasOne(ur => ur.Movie)
            .WithMany(m => m.UserRatings)
            .HasForeignKey(ur => ur.MovieID);

        modelBuilder.Entity<Movie>()
            .HasOne(m => m.Producer)
            .WithMany(p => p.Movies)
            .HasForeignKey(m => m.ProducerID);

        modelBuilder.Entity<Rating>()
            .HasOne(r => r.Movie)
            .WithMany(m => m.Ratings)
            .HasForeignKey(r => r.MovieID);

        // Configure default values
        modelBuilder.Entity<UserRating>()
            .Property(ur => ur.RatedAt)
            .HasDefaultValueSql("GETDATE()");

        modelBuilder.Entity<Rating>()
            .Property(r => r.MaxScore)
            .HasDefaultValue(10.0m);

        modelBuilder.Entity<MovieActor>()
            .Property(ma => ma.IsLead)
            .HasDefaultValue(false);
    }
}
