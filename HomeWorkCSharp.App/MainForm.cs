using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using HomeWorkCSharp.Classes;

namespace HomeWorkCSharp.App
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();

            AllEditorsHide();
        }

        private void Exit_MenuClick(object sender, EventArgs e)
        {
            this.Close();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void AllEditorsHide()
        {
            ucGoodsDescriptionList.Visible = false;
            ucContractorsList1.Visible = false;
            ucGoodsRecordsList1.Visible = false;
        }

        private void GoodsDescriptionsShow_MenuClick(object sender, EventArgs e)
        {
            AllEditorsHide();
            ucGoodsDescriptionList.Visible = true;
        }

        private void Suppliers_MenuItem_Click(object sender, EventArgs e)
        {
            AllEditorsHide();
            ucContractorsList1.CurrContrType = ContrType.Supplier;
            ucContractorsList1.RefreshGridAndButtons();
            ucContractorsList1.Visible = true;
        }

        private void Customers_MenuItem_Click(object sender, EventArgs e)
        {
            AllEditorsHide();
            ucContractorsList1.CurrContrType = ContrType.Customer;
            ucContractorsList1.RefreshGridAndButtons();
            ucContractorsList1.Visible = true;
        }

        private void SuppliedGoods_MenuItem_Click(object sender, EventArgs e)
        {
            AllEditorsHide();
            ucGoodsRecordsList1.CurrGoodsRecType = GoodsRecType.SuppliedGoods;
            ucGoodsRecordsList1.RefreshGridAndButtons();
            ucGoodsRecordsList1.Visible = true;
        }

        private void StoredGoods_MenuItem_Click(object sender, EventArgs e)
        {
            AllEditorsHide();
            ucGoodsRecordsList1.CurrGoodsRecType = GoodsRecType.StoredGoods;
            ucGoodsRecordsList1.RefreshGridAndButtons();
            ucGoodsRecordsList1.Visible = true;
        }

        private void ShippedGoods_MenuItem_Click(object sender, EventArgs e)
        {
            AllEditorsHide();
            ucGoodsRecordsList1.CurrGoodsRecType = GoodsRecType.ShippedGoods;
            ucGoodsRecordsList1.RefreshGridAndButtons();
            ucGoodsRecordsList1.Visible = true;
        }
    }
}
