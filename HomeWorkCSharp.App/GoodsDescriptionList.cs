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
    public partial class GoodsDescriptionList : UserControl
    {
        private List<GoodsDescription> _gdList = null;
        
        public GoodsDescriptionList()
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
                _gdList = BusinessLogicHandler.GetBL().ReadGoodsDescriptionsAll(); // обновляем данные грида
            }

            //  обновляем вид грида
            dgvMain.AutoGenerateColumns = false;
            dgvMain.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvMain.MultiSelect = false;
            dgvMain.DataSource = _gdList;

            // обновляем вид кнопок
            if (_gdList == null ) 
            {
                btnCreate.Enabled = false;
                btnUpdate.Enabled = false;
                btnDelete.Enabled = false;
            }
            else
            {
                btnCreate.Enabled = true;
                if(_gdList.Count <= 0)
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
            GoodsDescription currGoodDesc = new GoodsDescription()
            {
                Id = (Int32)(selRow.Cells["colId"].Value),
                Name = (String)(selRow.Cells["colName"].Value),
                CurrentPrice = (Decimal)(selRow.Cells["colCurrentPrice"].Value)
            };

            BusinessLogicHandler.GetBL().DeleteGoodsDescription(currGoodDesc);

            RefreshGridAndButtons();
        }

        private void btnCreate_Click(object sender, EventArgs e)
        {
            GoodsDescriptionEditForm _editForm = new GoodsDescriptionEditForm();
            _editForm.IsNew = true;
            _editForm.CurrGoodsDescriptionListUserControl = this;
            _editForm.ShowDialog();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (dgvMain.SelectedRows.Count <= 0) return;

            DataGridViewRow selRow = dgvMain.SelectedRows[0];
            GoodsDescription currGoodDesc = new GoodsDescription()
            {
                Id = (Int32)(selRow.Cells["colId"].Value),
                Name = (String)(selRow.Cells["colName"].Value),
                CurrentPrice = (Decimal)(selRow.Cells["colCurrentPrice"].Value)
            };

            GoodsDescriptionEditForm _editForm = new GoodsDescriptionEditForm();
            _editForm.IsNew = false;
            _editForm.CurrGoodsDesc = currGoodDesc;
            _editForm.CurrGoodsDescriptionListUserControl = this;
            _editForm.ShowDialog();
        }
    }
}
