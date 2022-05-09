using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Configuration;
using System.Runtime.InteropServices;
using TheLittleOrangeChannel.Models;

namespace TheLittleOrangeChannel.Controllers.Shared
{

    public static class Helper
    {

        public static SelectList EstadosBrasil()
        {
            var selectItems = new Dictionary<string, string>
            {
                {"AC","Acre"},
                {"AL","Alagoas"},
                {"AP","Amapá"},
                {"AM","Amazonas"},
                {"BA","Bahia"},
                {"CE","Ceará"},
                {"DF","Distrito Federal"},
                {"ES","Espírito Santo"},
                {"GO","Goiás"},
                {"MA","Maranhão"},
                {"MT","Mato Grosso"},
                {"MS","Mato Grosso do Sul"},
                {"MG","Minas Gerais"},
                {"PA","Pará"},
                {"PB","Paraíba"},
                {"PR","Paraná"},
                {"PE","Pernambuco"},
                {"PI","Piauí"},
                {"RJ","Rio de Janeiro"},
                {"RN","Rio Grande do Norte"},
                {"RS","Rio Grande do Sul"},
                {"RO","Rondônia"},
                {"RR","Roraima"},
                {"SC","Santa Catarina"},
                {"SP","São Paulo"},
                {"SE","Sergipe"},
                {"TO","Tocantins"},
            };

            return new SelectList(selectItems, "Key", "Value");

        }

        public static SelectList LocalEstoque()
        {
            var selectItems = new Dictionary<string, string>
            {
                {"ENTREGA","ENTREGA"},
                {"COLETA","COLETA"},
            };

            return new SelectList(selectItems, "Key", "Value");
        }

        public static SelectList EstadoCivil()
        {
            var selectItems = new Dictionary<string, string>
            {
                {"Casado","Casado"},
                {"Solteiro","Solteiro"},
                {"Separado","Separado"},
                {"Divorciado","Divorciado"},
                {"Viuvo","Viuvo"},
            };

            return new SelectList(selectItems, "Key", "Value");
        }

        public static SelectList Sexo()
        {
            var selectItems = new Dictionary<string, string>
            {
                {"F","Feminino"},
                {"M","Masculino"},
            };

            return new SelectList(selectItems, "Key", "Value");

        }

     




    }

}