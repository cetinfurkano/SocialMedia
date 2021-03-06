using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SozlukForum.Veriler.Concrete;

namespace SozlukForum.VeriErisim.Abstracts.VeriErisimBaseleri
{
    public abstract class YorumMetniDal:VeritabaniIslemi<YorumMetni>
    {
        public abstract void Guncelle(YorumMetni veri);
        public abstract YorumMetni IstekGetir(string YorumId);
    }
}
