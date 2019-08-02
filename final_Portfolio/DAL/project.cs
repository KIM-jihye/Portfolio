namespace final_Portfolio.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("project")]
    public partial class project
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int projectID { get; set; }

        public int studentID { get; set; }

        [Required]
        [StringLength(50)]
        public string projectname { get; set; }

        [Required]
        [StringLength(50)]
        public string organization { get; set; }

        [Required]
        public string discription { get; set; }

        public virtual project project1 { get; set; }

        public virtual project project2 { get; set; }
    }
}
