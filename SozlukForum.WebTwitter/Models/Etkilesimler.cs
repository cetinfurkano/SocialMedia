//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SozlukForum.WebTwitter.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Etkilesimler
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Etkilesimler()
        {
            this.Yorumlar = new HashSet<Yorumlar>();
            this.Kullanicilar = new HashSet<Kullanicilar>();
            this.Kullanicilar1 = new HashSet<Kullanicilar>();
        }
    
        public int EtkilesimId { get; set; }
        public string PaylasimId { get; set; }
    
        public virtual Paylasimlar Paylasimlar { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Yorumlar> Yorumlar { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Kullanicilar> Kullanicilar { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Kullanicilar> Kullanicilar1 { get; set; }
    }
}
