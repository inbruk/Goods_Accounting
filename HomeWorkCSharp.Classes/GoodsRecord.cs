using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;


namespace HomeWorkCSharp.Classes
{
    public class GoodsRecord
    {
        [Key] // аннотация данных ключевое поле
        public Int32 Id { set; get; }
        public Nullable<Decimal> ActionPrice { set; get; }
        public Nullable<DateTime> ActionDateTime { set; get; }
        public Int32 Amount { set; get; }
        public Int32 GoodsRecordsTypeId { set; get; }
        public Nullable<Int32> ContractorId { set; get; }
        public Int32 GoodsDescriptionId { set; get; }
    }
}
