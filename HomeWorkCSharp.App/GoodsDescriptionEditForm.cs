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
    public partial class GoodsDescriptionEditForm : Form
    {
        public GoodsDescriptionList CurrGoodsDescriptionListUserControl { set; get; }
        public GoodsDescription CurrGoodsDesc { set; get; }

        public Boolean IsNew { set; get; }

        public GoodsDescriptionEditForm()
        {
            InitializeComponent();
        }
        private void Form1_Shown(Object sender, EventArgs e)
        {
            if (IsNew)
            {
                tbxName.Text = "Название нового товара";
                tbxCurrentPrice.Text = "0,0";
                CurrGoodsDesc = new GoodsDescription();
            }
            else
            {
                tbxName.Text = CurrGoodsDesc.Name;
                tbxCurrentPrice.Text = CurrGoodsDesc.CurrentPrice.ToString();
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            CurrGoodsDesc.Name = tbxName.Text;
            CurrGoodsDesc.CurrentPrice = Decimal.Parse(tbxCurrentPrice.Text, CultureInfo.InstalledUICulture);

            if( IsNew )
            {
                BusinessLogicHandler.GetBL().CreateGoodsDescription(CurrGoodsDesc);
            }
            else
            {
                BusinessLogicHandler.GetBL().UpdateGoodsDescription(CurrGoodsDesc);
            }

            CurrGoodsDescriptionListUserControl.RefreshGridAndButtons();

            this.Close();
        }
    }
}
