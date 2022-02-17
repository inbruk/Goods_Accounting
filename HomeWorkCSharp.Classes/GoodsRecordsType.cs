using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace HomeWorkCSharp.Classes
{
    public class GoodsRecordsType
    {
        [Key] // аннотация данных ключевое поле
        public Int32 Id { set; get; }
        public String Value { set; get; }
        public ICollection<GoodsRecord> GoodsRecords { get; set; }
    }
}
