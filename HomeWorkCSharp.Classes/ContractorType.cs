using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace HomeWorkCSharp.Classes
{
    public class ContractorType
    {
        [Key] // аннотация данных ключевое поле
        public Int32 Id { set; get; }
        public String Value { set; get; }
        public ICollection<Contractor> Contractors { get; set; }
    }
}
