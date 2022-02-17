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
    public partial class ContractorEditForm : Form
    {
        public ucContractorsList CurrContractorsListUserControl { set; get; }
        public Contractor CurrContractor { set; get; }
        public Boolean IsNew { set; get; }

        public ContractorEditForm()
        {
            InitializeComponent();
        }
        private void FormShown(Object sender, EventArgs e)
        {
            if (CurrContractorsListUserControl.CurrContrType == ContrType.Supplier)
            {
                cbxContractorType.SelectedIndex = 0;
            }
            else
            {
                cbxContractorType.SelectedIndex = 1;
            }

            if (IsNew)
            {
                tbxName.Text = "Название нового контрагента";
                tbxPhone.Text = "0-000-00-00-00";
                tbxEMail.Text = "eee@.mail.ua";

                CurrContractor = new Contractor();
            }
            else
            {
                tbxName.Text  = CurrContractor.Name;
                tbxPhone.Text = CurrContractor.Phone;
                tbxEMail.Text = CurrContractor.EMail;
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            BusinessLogic currBL = BusinessLogicHandler.GetBL();

            if (cbxContractorType.SelectedIndex == 0)
            {
                CurrContractor.ContractorTypeId = currBL.GetContractorTypeIdByContrType(ContrType.Supplier);
            }
            else
            {
                CurrContractor.ContractorTypeId = currBL.GetContractorTypeIdByContrType(ContrType.Customer);
            }

            CurrContractor.Name  = tbxName.Text;
            CurrContractor.Phone = tbxPhone.Text;
            CurrContractor.EMail = tbxEMail.Text;

            if (IsNew)
            {
                BusinessLogicHandler.GetBL().CreateContractor(CurrContractor);
            }
            else
            {
                BusinessLogicHandler.GetBL().UpdateContractor(CurrContractor);
            }

            CurrContractorsListUserControl.RefreshGridAndButtons();

            this.Close();
        }
    }
}
