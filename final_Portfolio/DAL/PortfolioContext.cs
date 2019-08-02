namespace final_Portfolio.DAL
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class PortfolioContext : DbContext
    {
        public PortfolioContext()
            : base("name=PortfolioContext")
        {
        }

        public virtual DbSet<Course> Courses { get; set; }
        public virtual DbSet<P_Information> P_Information { get; set; }
        public virtual DbSet<project> projects { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Course>()
                .Property(e => e.coursename)
                .IsUnicode(false);

            modelBuilder.Entity<P_Information>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<P_Information>()
                .Property(e => e.phonenum)
                .IsUnicode(false);

            modelBuilder.Entity<P_Information>()
                .Property(e => e.university)
                .IsUnicode(false);

            modelBuilder.Entity<P_Information>()
                .Property(e => e.major)
                .IsUnicode(false);

            modelBuilder.Entity<P_Information>()
                .Property(e => e.url)
                .IsUnicode(false);

            modelBuilder.Entity<P_Information>()
                .HasOptional(e => e.P_Information1)
                .WithRequired(e => e.P_Information2);

            modelBuilder.Entity<project>()
                .Property(e => e.projectname)
                .IsUnicode(false);

            modelBuilder.Entity<project>()
                .Property(e => e.organization)
                .IsUnicode(false);

            modelBuilder.Entity<project>()
                .Property(e => e.discription)
                .IsUnicode(false);

            modelBuilder.Entity<project>()
                .HasOptional(e => e.project1)
                .WithRequired(e => e.project2);
        }
    }
}
