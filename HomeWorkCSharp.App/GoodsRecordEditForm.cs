using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Globalization;

using HomeWorkCSharp.Classes;

namespace HomeWorkCSharp.App
{
    public partial class GoodsRecordEditForm : Form
    {
        public ucGoodsRecordsList CurrGoodsRecordsListUserControl { set; get; }
        public GoodsRecord CurrGoodsRecord { set; get; }
        public Boolean IsNew { set; get; }

        private BusinessLogic _currBL = BusinessLogicHandler.GetBL();
        private List<GoodsDescription> _currGoodsDescriptionsList;
        private List<Contractor> _currContractorsList;

        private Decimal _currentActionPrice = 0.0m;

        public GoodsRecordEditForm()
        {
            InitializeComponent();

            cbxRecordType.Enabled = false; // не убирать иначе будут ошибки при смене типа записи, вместо смены удалить запись одного типа и добавить другого
        }
        private void cbxGoodsName_Fill()
        {
            _currGoodsDescriptionsList = _currBL.ReadGoodsDescriptionsAll();
            String[] goodDescsStrList = _currGoodsDescriptionsList.Select(x => x.Name).ToArray();
            cbxGoodsName.Items.AddRange(goodDescsStrList);

            // установим текущее значение 
            if (IsNew )
            {
                cbxGoodsName.SelectedIndex = 0;
            }
            else            
            {

                Int32 i = 0;
                for(; i<_currGoodsDescriptionsList.Count;i++)
                {
                    if (_currGoodsDescriptionsList[i].Id == CurrGoodsRecord.GoodsDescriptionId)
                        break;
                }

                if (i == _currGoodsDescriptionsList.Count) i = 0; // перестраховка
                cbxGoodsName.SelectedIndex = i; // если нет ошибок должно попасть в диапазон                    
            }
        }
        private void cbxContractorName_Fill()
        {
            ContrType contrType;
            if (CurrGoodsRecordsListUserControl.CurrGoodsRecType == GoodsRecType.SuppliedGoods)
            {
                contrType = ContrType.Supplier;
            }
            else // при GoodsRecType.StoredGoods сюда не попадем
            {
                contrType = ContrType.Customer;
            }

            _currContractorsList = _currBL.ReadContractorsAll(contrType);
            String[] contractorsStrList = _currContractorsList.Select(x => x.Name).ToArray();
            cbxContractorName.Items.AddRange(contractorsStrList);

            // установим текущее значение 
            if (IsNew || CurrGoodsRecordsListUserControl.CurrGoodsRecType == GoodsRecType.StoredGoods)
            {
                cbxContractorName.SelectedIndex = 0;
            }
            else
            {
                Int32 i = 0;
                for (; i < _currContractorsList.Count; i++)
                {
                    if (_currContractorsList[i].Id == (int)CurrGoodsRecord.ContractorId)
                        break;
                }

                if (i == _currContractorsList.Count) i = 0; // перестраховка
                cbxContractorName.SelectedIndex = i; 
            }        
        }
        private void FormShown(Object sender, EventArgs e)
        {
            // заполним и выставим текущее значение в выпадающих списках
            if (CurrGoodsRecordsListUserControl.CurrGoodsRecType == GoodsRecType.StoredGoods)
            {
                cbxRecordType.SelectedIndex = 1;

                lblActionPrice.Visible = false;
                lblActionDateTime.Visible = false;
                tbxActionPrice.Visible = false;
                tbxActionDateTime.Visible = false;

                cbxContractorName.Visible = false;
                lblContractor.Visible = false;
            }
            else
            {
                if (CurrGoodsRecordsListUserControl.CurrGoodsRecType == GoodsRecType.SuppliedGoods)
                {
                    cbxRecordType.SelectedIndex = 0;
                }
                else
                {
                    cbxRecordType.SelectedIndex = 2;
                }
            }

            cbxGoodsName_Fill();
            cbxContractorName_Fill();

            if (IsNew)
            {
                tbxAmount.Text = "0";
                if (CurrGoodsRecordsListUserControl.CurrGoodsRecType != GoodsRecType.StoredGoods)
                {
                    tbxActionPrice.Text = _currentActionPrice.ToString(CultureInfo.CurrentCulture);
                    tbxActionDateTime.Text = DateTime.Now.ToString();
                }

                CurrGoodsRecord = new GoodsRecord();
            }
            else
            {
                tbxAmount.Text = CurrGoodsRecord.Amount.ToString();
                if (CurrGoodsRecordsListUserControl.CurrGoodsRecType != GoodsRecType.StoredGoods)
                {
                    tbxActionPrice.Text = ((Decimal)CurrGoodsRecord.ActionPrice).ToString(CultureInfo.CurrentCulture);
                    tbxActionDateTime.Text = CurrGoodsRecord.ActionDateTime.ToString();
                }
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            switch(cbxRecordType.SelectedIndex)
            { 
                case 0:
                    CurrGoodsRecord.GoodsRecordsTypeId = _currBL.GetGoodsRecordsTypeIdByGoodsRecType(GoodsRecType.SuppliedGoods);
                break;
                case 1:
                    CurrGoodsRecord.GoodsRecordsTypeId = _currBL.GetGoodsRecordsTypeIdByGoodsRecType(GoodsRecType.StoredGoods);
                break;
                case 2:
                    CurrGoodsRecord.GoodsRecordsTypeId = _currBL.GetGoodsRecordsTypeIdByGoodsRecType(GoodsRecType.ShippedGoods);
                break;
            }

            CurrGoodsRecord.GoodsDescriptionId = _currGoodsDescriptionsList[cbxGoodsName.SelectedIndex].Id;
            CurrGoodsRecord.ContractorId = _currContractorsList[cbxContractorName.SelectedIndex].Id;

            CurrGoodsRecord.Amount = Int32.Parse(tbxAmount.Text, CultureInfo.CurrentCulture);
            if (CurrGoodsRecordsListUserControl.CurrGoodsRecType != GoodsRecType.StoredGoods)
            {
                CurrGoodsRecord.ActionPrice = Decimal.Parse(tbxActionPrice.Text, CultureInfo.CurrentCulture);
                CurrGoodsRecord.ActionDateTime = DateTime.Parse(tbxActionDateTime.Text, CultureInfo.CurrentCulture);
            }

            if (IsNew)
            {
                _currBL.CreateGoodsRecord(CurrGoodsRecord);
            }
            else
            {
                _currBL.UpdateGoodsRecord(CurrGoodsRecord);
            }

            CurrGoodsRecordsListUserControl.RefreshGridAndButtons();

            this.Close();
        }
    }
}
