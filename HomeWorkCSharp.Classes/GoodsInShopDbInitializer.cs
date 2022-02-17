using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace HomeWorkCSharp.Classes
{
    /// <summary>
    /// служит для инициализации необходимых, а не тестовых данных в БД GoodsInShop()
    /// </summary>
    public class GoodsInShopDbInitializer : DropCreateDatabaseIfModelChanges<GoodsInShopContext>
    {
        protected override void Seed(GoodsInShopContext context)
        {
            var conTypes = new List<ContractorType>
            {
                new ContractorType { Value = "Поставщик" },
                new ContractorType { Value = "Покупатель" }
            };
            conTypes.ForEach(s => context.ContractorTypes.Add(s));
            context.SaveChanges();

            var grTypes = new List<GoodsRecordsType>
            {
                new GoodsRecordsType { Value = "Поставленые товары" },
                new GoodsRecordsType { Value = "Отгруженые товары" },
                new GoodsRecordsType { Value = "Товары в магазине" }
            };
            grTypes.ForEach(s => context.GoodsRecordsTypes.Add(s));
            context.SaveChanges();

        }
    }
}
