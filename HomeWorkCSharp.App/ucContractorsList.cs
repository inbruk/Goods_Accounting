using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using HomeWorkCSharp.Classes;

namespace HomeWorkCSharp.App
{
    public partial class ucContractorsList : UserControl
    {
        public ContrType CurrContrType { set; get; }

        private List<Contractor> _conList = null;
        public ucContractorsList()
        {
            InitializeComponent();

            RefreshGridAndButtons();
        }
        public void RefreshGridAndButtons()
        {
            // если мы сейчас в режиме дизайна, то грузить из БД данные пока не можем
            // обычный DesignMode при вызове из конструктора не работает
            if (DesignTimeCheckerWorksInUCConstructor.IsNow() == false)
            {
                _conList = BusinessLogicHandler.GetBL().ReadContractorsAll(CurrContrType); // обновляем данные грида
            }

            // обновляем заголовок
            if( CurrContrType==ContrType.Supplier)
            { 
                lblCaption.Text = "Поставщики"; 
            }
            if( CurrContrType==ContrType.Customer)
            {
                lblCaption.Text = "Покупатели"; 
            }

            //  обновляем вид грида
            dgvMain.AutoGenerateColumns = false;
            dgvMain.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvMain.MultiSelect = false;
            dgvMain.DataSource = _conList;

            // обновляем вид кнопок
            if (_conList == null)
            {
                btnCreate.Enabled = false;
                btnUpdate.Enabled = false;
                btnDelete.Enabled = false;
            }
            else
            {
                btnCreate.Enabled = true;
                if (_conList.Count <= 0)
                {
                    btnUpdate.Enabled = false;
                    btnDelete.Enabled = false;
                }
                else
                {
                    btnUpdate.Enabled = true;
                    btnDelete.Enabled = true;
                }
            }
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (dgvMain.SelectedRows.Count <= 0) return;

            DataGridViewRow selRow = dgvMain.SelectedRows[0];
            Contractor currContractor = new Contractor()
            {
                Id = (Int32)(selRow.Cells["colId"].Value),
                Name = (String)(selRow.Cells["colName"].Value),
                Phone = (String)(selRow.Cells["colPhone"].Value),
                EMail = (String)(selRow.Cells["colEMail"].Value),
                ContractorTypeId = BusinessLogicHandler.GetBL().GetContractorTypeIdByContrType(CurrContrType)
            };

            BusinessLogicHandler.GetBL().DeleteContractor(currContractor);

            RefreshGridAndButtons();
        }
        private void btnCreate_Click(object sender, EventArgs e)
        {
            ContractorEditForm _editForm = new ContractorEditForm();
            _editForm.IsNew = true;
            _editForm.CurrContractorsListUserControl = this;
            _editForm.ShowDialog();
        }
        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (dgvMain.SelectedRows.Count <= 0) return;

            DataGridViewRow selRow = dgvMain.SelectedRows[0];
            Contractor currContractor = new Contractor()
            {
                Id = (Int32)(selRow.Cells["colId"].Value),
                Name = (String)(selRow.Cells["colName"].Value),
                Phone = (String)(selRow.Cells["colPhone"].Value),
                EMail = (String)(selRow.Cells["colEMail"].Value),
                ContractorTypeId = BusinessLogicHandler.GetBL().GetContractorTypeIdByContrType(CurrContrType)
            };

            ContractorEditForm _editForm = new ContractorEditForm();
            _editForm.IsNew = false;
            _editForm.CurrContractor = currContractor;
            _editForm.CurrContractorsListUserControl = this;
            _editForm.ShowDialog();
        }
    }
}
