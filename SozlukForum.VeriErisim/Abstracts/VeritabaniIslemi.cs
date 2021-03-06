using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SozlukForum.Veriler.Abstracts;

namespace SozlukForum.VeriErisim.Abstracts
{
    public abstract class VeritabaniIslemi<T> where T: class, INesne,new()
    {
        protected string yol = @"Data Source=FURKAN-PC;Initial Catalog = SozlukForum; Integrated Security = True;MultipleActiveResultSets=True;";
       
        public abstract void Ekle(T veri);
        public abstract void Sil(T veri);
      
       
    }
}
