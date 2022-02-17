using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeWorkCSharp.Classes
{
    public enum ContrType { Supplier, Customer };
    public enum GoodsRecType { SuppliedGoods, StoredGoods, ShippedGoods };

    public class BusinessLogic
    {
        // ------------------------------------------------------------- AUXILIARY METHODS ---------------------------------------------------------------------------------

        private GoodsInShopContext _currCtx = null;
        private GoodsInShopContext GetCurrContext()
        {
            if (_currCtx == null)
            {
                // заполним внутреннюю вспомогательную переменную, чтобы не пересоздавать объект контекста
                _currCtx = new GoodsInShopContext();
            }

            return _currCtx;
        }

        private Dictionary<ContrType, Int32> _contrType2ContractorTypeId;

        // заполним словарь преобразрвания enum-ов в id-ы для типов контрагента, если еще не заполнен
        // и вернем с помощью него ид типа контрагента
        public Int32 GetContractorTypeIdByContrType(ContrType contrType)
        {
            if( _contrType2ContractorTypeId==null )
            {
                _contrType2ContractorTypeId = new Dictionary<ContrType, Int32>();
                GoodsInShopContext currCtx = GetCurrContext();
                _contrType2ContractorTypeId.Add( ContrType.Supplier, currCtx.ContractorTypes.Single(x => x.Value == "Поставщик").Id );
                _contrType2ContractorTypeId.Add(ContrType.Customer, currCtx.ContractorTypes.Single(x => x.Value == "Покупатель").Id );
            }

            Int32 res = _contrType2ContractorTypeId[contrType];
            return res;
        }

        private Dictionary<GoodsRecType, Int32> _goodsRecType2GoodsRecordsTypeId;

        // заполним словарь преобразрвания enum-ов в id-ы для типов журнала товаров, если еще не заполнен
        // и вернем с помощью него ид типа журнала товаров
        public Int32 GetGoodsRecordsTypeIdByGoodsRecType(GoodsRecType goodsRecType)
        {
            if (_goodsRecType2GoodsRecordsTypeId == null)
            {
                _goodsRecType2GoodsRecordsTypeId = new Dictionary<GoodsRecType, Int32>();
                GoodsInShopContext currCtx = GetCurrContext();
                _goodsRecType2GoodsRecordsTypeId.Add( GoodsRecType.SuppliedGoods, currCtx.GoodsRecordsTypes.Single(x => x.Value == "Поставленые товары").Id );
                _goodsRecType2GoodsRecordsTypeId.Add( GoodsRecType.StoredGoods, currCtx.GoodsRecordsTypes.Single(x => x.Value == "Товары в магазине").Id );
                _goodsRecType2GoodsRecordsTypeId.Add( GoodsRecType.ShippedGoods, currCtx.GoodsRecordsTypes.Single(x => x.Value == "Отгруженые товары").Id );
            }

            Int32 res = _goodsRecType2GoodsRecordsTypeId[goodsRecType];
            return res;
        }

        // ------------------------------------------------------------- GOODS DESCRIPTIONS METHODS --------------------------------------------------------------------------

        public List<GoodsDescription> ReadGoodsDescriptionsAll()
        {
            GoodsInShopContext currCtx = GetCurrContext();
            List<GoodsDescription> res = currCtx.GoodsDescriptions.ToList();
            return res;
        }
        public void CreateGoodsDescription(GoodsDescription currGd)
        {
            GoodsInShopContext currCtx = GetCurrContext();
            currCtx.GoodsDescriptions.Add(currGd);
            currCtx.SaveChanges();
        }

        public void UpdateGoodsDescription(GoodsDescription currGd)
        {
            GoodsInShopContext currCtx = GetCurrContext();

            GoodsDescription dbGd = currCtx.GoodsDescriptions.Single(x => x.Id == currGd.Id);

            dbGd.Name  = currGd.Name;
            dbGd.CurrentPrice = currGd.CurrentPrice;

            currCtx.SaveChanges();
        }

        public void DeleteGoodsDescription(GoodsDescription currGd)
        {
            GoodsInShopContext currCtx = GetCurrContext();

            // удалим связанные записи в журналах товаров
            var goodRecList = currCtx.GoodsRecords.Where(x => x.GoodsDescriptionId == currGd.Id);
            currCtx.GoodsRecords.RemoveRange(goodRecList);
            currCtx.SaveChanges();
            
            // теперь удалим запись из описаний товаров
            currGd = currCtx.GoodsDescriptions.Single(x => x.Id == currGd.Id); // для удаления нужны адекватные записи
            currCtx.GoodsDescriptions.Remove(currGd);
            currCtx.SaveChanges();
        }
        
        // ------------------------------------------------------------- CONTRACTORS METHODS ---------------------------------------------------------------------------------

        public List<Contractor> ReadContractorsAll(ContrType conType)
        {
            Int32 currTypeId = GetContractorTypeIdByContrType(conType);

            GoodsInShopContext currCtx = GetCurrContext();
            List<Contractor> res = currCtx.Contractors.Where( x => x.ContractorTypeId==currTypeId ).ToList();
            return res;
        }
        public void CreateContractor( Contractor currCon)
        {
            GoodsInShopContext currCtx = GetCurrContext();
            currCtx.Contractors.Add(currCon);
            currCtx.SaveChanges();
        }

        public void UpdateContractor(Contractor currCon)
        {
            GoodsInShopContext currCtx = GetCurrContext();

            Contractor dbCon = currCtx.Contractors.Single( x => x.Id == currCon.Id );

            dbCon.Name = currCon.Name;
            dbCon.EMail = currCon.EMail;
            dbCon.Phone = currCon.Phone;
            dbCon.ContractorTypeId = currCon.ContractorTypeId;

            currCtx.SaveChanges();
        }

        public void DeleteContractor(Contractor currCon)
        {
            GoodsInShopContext currCtx = GetCurrContext();
            
            // удалим связанные записи в журналах товаров
            var goodRecList = currCtx.GoodsRecords.Where(x => x.ContractorId == currCon.Id);
            currCtx.GoodsRecords.RemoveRange(goodRecList);
            currCtx.SaveChanges();
            
            // теперь удалим запись из контрагентов
            currCon = currCtx.Contractors.Single(x => x.Id == currCon.Id); // для удаления нужны адекватные записи
            currCtx.Contractors.Remove(currCon);
            currCtx.SaveChanges();
        }

        // ------------------------------------------------------------- GOODS RECORDS METHODS ---------------------------------------------------------------------------------

        /// <summary>
        /// загружает список описаний записей журнала в удобном для показа в гриде виде
        /// используется также в форме редактирования
        /// </summary>
        public List<GoodsRecordFull> ReadGoodsRecordsAll(GoodsRecType grType)
        {
            Int32 currTypeId = GetGoodsRecordsTypeIdByGoodsRecType(grType);
            GoodsInShopContext currCtx = GetCurrContext();
            List<GoodsRecordFull> res = null;

            if (grType == GoodsRecType.StoredGoods) 
            {
                // в случае хранения в магазине объединение таблиц вернет 0 записей всегда, так как в LINQ join по умолчанию это inner join
                // сделать отдельный запрос проще чем LEFT JOIN
                res = (from GR in currCtx.GoodsRecords                       
                       join GD in currCtx.GoodsDescriptions on GR.GoodsDescriptionId equals GD.Id
                       where GR.GoodsRecordsTypeId == currTypeId
                       select new GoodsRecordFull()
                       {
                           Id = GR.Id,
                           ActionDateTime = GR.ActionDateTime,
                           ActionPrice = GR.ActionPrice,
                           Amount = GR.Amount,
                           GoodsRecordsTypeId = GR.GoodsRecordsTypeId,
                           GoodsDescriptionId = GR.GoodsDescriptionId,
                           GoodsName = GD.Name,
                           ContractorId = null,
                           ContractorName = ""
                       }).ToList();
            }
            else
            {
                // единственный сложный запрос объединяющий данные из трех таблиц
                // нужен чтобы заполнить поля с названием товара и название контрагента при возвращении записей журнала
                res = (from GR in currCtx.GoodsRecords
                       join Cont in currCtx.Contractors on GR.ContractorId equals Cont.Id
                       join GD in currCtx.GoodsDescriptions on GR.GoodsDescriptionId equals GD.Id
                       where GR.GoodsRecordsTypeId == currTypeId
                       select new GoodsRecordFull()
                       {
                           Id = GR.Id,
                           ActionDateTime = GR.ActionDateTime,
                           ActionPrice = GR.ActionPrice,
                           Amount = GR.Amount,
                           GoodsRecordsTypeId = GR.GoodsRecordsTypeId,
                           GoodsDescriptionId = GR.GoodsDescriptionId,
                           GoodsName = GD.Name,
                           ContractorId = GR.ContractorId,
                           ContractorName = Cont.Name
                       }).ToList();
            }
            return res;
        }
        
        public void CreateGoodsRecord(GoodsRecord currGr)
        {
            GoodsInShopContext currCtx = GetCurrContext();
            currCtx.GoodsRecords.Add(currGr);
            currCtx.SaveChanges();
        }

        /// <summary>
        /// единственный метод бизнес логики возвращающий одну запись из таблицы,
        /// для других сущностей такие методы в этом приложении просто не нужны, нужны только возвращающие все записи
        /// метод используется только в форме редактирования записи журнала
        /// </summary>
        public GoodsRecord ReadGoodsRecordById(Int32 id)
        {
            GoodsInShopContext currCtx = GetCurrContext();
            GoodsRecord currGr = currCtx.GoodsRecords.Single(x => x.Id == id);
            return currGr;
        }

        public void UpdateGoodsRecord(GoodsRecord currGr)
        {
            GoodsInShopContext currCtx = GetCurrContext();

            GoodsRecord dbGr = currCtx.GoodsRecords.Single(x => x.Id == currGr.Id);

            dbGr.ActionDateTime  = currGr.ActionDateTime;
            dbGr.ActionPrice = currGr.ActionPrice;
            dbGr.Amount = currGr.Amount;
            dbGr.ContractorId = currGr.ContractorId;
            dbGr.GoodsDescriptionId = currGr.GoodsDescriptionId;
            dbGr.GoodsRecordsTypeId = currGr.GoodsRecordsTypeId;

            currCtx.SaveChanges();
        }

        public void DeleteGoodsRecord(GoodsRecord currGr)
        {
            GoodsInShopContext currCtx = GetCurrContext();
            currGr = currCtx.GoodsRecords.Single(x => x.Id == currGr.Id); // для удаления нужны адекватные записи
            currCtx.GoodsRecords.Remove(currGr);
            currCtx.SaveChanges();
        }
    }
}
