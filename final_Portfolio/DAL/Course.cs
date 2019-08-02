namespace final_Portfolio.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Course")]
    public partial class Course
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int courseID { get; set; }

        public int studentID { get; set; }

        [Required]
        [StringLength(50)]
        public string coursename { get; set; }
    }
}
