using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeWorkCSharp.App
{
    public static class DesignTimeCheckerWorksInUCConstructor
    {
        public static Boolean IsNow()
        {
            Boolean res = System.Diagnostics.Process.GetCurrentProcess().ProcessName == "devenv";
            return res;
        }
    }
}
