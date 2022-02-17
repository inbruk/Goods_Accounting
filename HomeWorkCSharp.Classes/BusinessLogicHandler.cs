using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeWorkCSharp.Classes
{
    public static class BusinessLogicHandler
    {
        private static BusinessLogic _currBL = null;
        public static BusinessLogic GetBL()
        {
            if( _currBL==null )
            {
                _currBL = new BusinessLogic();
            }

            return _currBL;
        }
    }
}
