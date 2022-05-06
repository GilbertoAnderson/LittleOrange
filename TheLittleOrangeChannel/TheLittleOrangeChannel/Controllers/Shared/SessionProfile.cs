using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;


namespace TheLittleOrangeChannel.Controllers.Shared
{

    public class SessionProfile 
    {


        private enum Key : short
        {
            ADM,
            Canal,
            PerfisAcesso,
            Logado

        }



        public static bool Canal
        {
            get
            {
                if (HttpContext.Current.Session[Key.Canal.ToString()] == null)
                    return false;

                return (bool)HttpContext.Current.Session[Key.Canal.ToString()];
            }
            set
            {
                HttpContext.Current.Session[Key.Canal.ToString()] = value;
            }

        }


        public static bool ADM
        {
            get
            {
                if (HttpContext.Current.Session[Key.ADM.ToString()] == null)
                    return false;

                return (bool)HttpContext.Current.Session[Key.ADM.ToString()];
            }
            set
            {
                HttpContext.Current.Session[Key.ADM.ToString()] = value;
            }

        }



        public static bool Logado
        {
            get
            {
                if (HttpContext.Current.Session[Key.Logado.ToString()] == null)
                    return false;

                return (bool)HttpContext.Current.Session[Key.Logado.ToString()];
            }
            set
            {
                HttpContext.Current.Session[Key.Logado.ToString()] = value;
            }

        }



    }
}