using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;

namespace HomeWorkCSharp.Classes
{
    public class GoodsInShopContext : DbContext
    {
        public GoodsInShopContext() : base("DBConnection") 
        { 
        }
        public DbSet<Contractor> Contractors { set; get; }
        public DbSet<ContractorType> ContractorTypes { set; get; }
        public DbSet<GoodsDescription> GoodsDescriptions { set; get; }
        public DbSet<GoodsRecord> GoodsRecords { set; get; }
        public DbSet<GoodsRecordsType> GoodsRecordsTypes { set; get; }
    }
}
