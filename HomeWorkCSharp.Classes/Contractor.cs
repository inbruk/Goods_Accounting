using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;

namespace HomeWorkCSharp.Classes
{
    public class Contractor 
    {
        [Key] // аннотация данных ключевое поле
        public Int32 Id { set; get; }
        public String Name { set; get; }

        
        public String Phone { set; get; }

        
        public String EMail { set; get; }

        public Int32 ContractorTypeId { set; get; }
        public ICollection<GoodsRecord> GoodsRecords { get; set; }
    }
}
