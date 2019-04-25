using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public class Class1
    {
        public string Dictionary(string text) {
            string x="";
            switch (text)
            {
                case "Al":
                    x = "铝";
                    break;
                case "Fe":
                    x = "铁";
                    break;
                case "Cu":
                    x = "铜";
                    break;
                case "Pb":
                    x = "铅";
                    break;
                case "Sn":
                    x = "锡";
                    break;
                case "Ti":
                    x = "钛";
                    break;
                case "Cr":
                    x = "铬";
                    break;
                case "Ni":
                    x = "镍";
                    break;
            }
            return x;
        }

        public string Dictionary_(string text)
        {
            string x = "";
            switch (text)
            {
                case "铝         ":
                    x = "Al";
                    break;
                case "铁         ":
                    x = "Fe";
                    break;
                case "铜         ":
                    x = "Cu";
                    break;
                case "铅         ":
                    x = "Pb";
                    break;
                case "锡         ":
                    x = "Sn";
                    break;
                case "钛         ":
                    x = "Ti";
                    break;
                case "铬         ":
                    x = "Cr";
                    break;
                case "镍         ":
                    x = "Ni";
                    break;
            }
            return x;
        }
    }
}