namespace final_Portfolio.DAL
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class P_Information
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int studentID { get; set; }

        [Required]
        [StringLength(10)]
        public string name { get; set; }

        public int age { get; set; }

        [Required]
        [StringLength(50)]
        public string phonenum { get; set; }

        [Required]
        [StringLength(50)]
        public string university { get; set; }

        [Required]
        [StringLength(50)]
        public string major { get; set; }

        [Required]
        [StringLength(50)]
        public string url { get; set; }

        public virtual P_Information P_Information1 { get; set; }

        public virtual P_Information P_Information2 { get; set; }
    }
}
