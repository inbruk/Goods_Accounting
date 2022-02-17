using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

using HomeWorkCSharp.Classes;

namespace HomeWorkCSharp.CreateDatabaseApp
{
    class Program
    {
        static void Main(string[] args)
        {
            // этот код используется только для создания БД при запуске программы, при последующей работе он не нужен
            HomeWorkCSharp.Classes.GoodsInShopContext gsc = new GoodsInShopContext();

            // выполняем инициализацию необходимыми значениями, вызывая метод seed() внутри
            Database.SetInitializer<GoodsInShopContext>(new GoodsInShopDbInitializer());

            ContractorType cont = new ContractorType()
            {
                Value = "тест"
            };
            gsc.ContractorTypes.Add(cont);
            gsc.SaveChanges();
        }
    }
}
