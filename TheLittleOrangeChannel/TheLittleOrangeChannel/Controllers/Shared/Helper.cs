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

        public static bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }


        public static bool IsValid(string cpfCnpj)
        {
            return (IsCpf(cpfCnpj) || IsCnpj(cpfCnpj));
        }

        private static bool IsCpf(string cpf)
        {
            int[] multiplicador1 = new int[9] { 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            int[] multiplicador2 = new int[10] { 11, 10, 9, 8, 7, 6, 5, 4, 3, 2 };

            cpf = cpf.Trim().Replace(".", "").Replace("-", "");
            if (cpf.Length != 11)
                return false;

            for (int j = 0; j < 10; j++)
                if (j.ToString().PadLeft(11, char.Parse(j.ToString())) == cpf)
                    return false;

            string tempCpf = cpf.Substring(0, 9);
            int soma = 0;

            for (int i = 0; i < 9; i++)
                soma += int.Parse(tempCpf[i].ToString()) * multiplicador1[i];

            int resto = soma % 11;
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            string digito = resto.ToString();
            tempCpf = tempCpf + digito;
            soma = 0;
            for (int i = 0; i < 10; i++)
                soma += int.Parse(tempCpf[i].ToString()) * multiplicador2[i];

            resto = soma % 11;
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            digito = digito + resto.ToString();

            return cpf.EndsWith(digito);
        }

        private static bool IsCnpj(string cnpj)
        {
            int[] multiplicador1 = new int[12] { 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 };
            int[] multiplicador2 = new int[13] { 6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2 };

            cnpj = cnpj.Trim().Replace(".", "").Replace("-", "").Replace("/", "");
            if (cnpj.Length != 14)
                return false;

            string tempCnpj = cnpj.Substring(0, 12);
            int soma = 0;

            for (int i = 0; i < 12; i++)
                soma += int.Parse(tempCnpj[i].ToString()) * multiplicador1[i];

            int resto = (soma % 11);
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            string digito = resto.ToString();
            tempCnpj = tempCnpj + digito;
            soma = 0;
            for (int i = 0; i < 13; i++)
                soma += int.Parse(tempCnpj[i].ToString()) * multiplicador2[i];

            resto = (soma % 11);
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            digito = digito + resto.ToString();

            return cnpj.EndsWith(digito);
        }




    }

}