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
    public partial class ucGoodsRecordsList : UserControl
    {
        private BusinessLogic _currBL = BusinessLogicHandler.GetBL();
        public GoodsRecType CurrGoodsRecType { set; get; }

        private List<GoodsRecordFull> _grList = null;
        public ucGoodsRecordsList()
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
                _grList = BusinessLogicHandler.GetBL().ReadGoodsRecordsAll(CurrGoodsRecType); // обновляем данные грида
            }

            // обновляем заголовок и колонки грида
            if (CurrGoodsRecType == GoodsRecType.SuppliedGoods)
            {
                lblCaption.Text = "Журнал поставки (завоза) товаров";

                dgvMain.Columns[1].HeaderText = "Цена закупки";
                dgvMain.Columns[1].Visible = true;
                dgvMain.Columns[2].HeaderText = "Дата закупки";
                dgvMain.Columns[2].Visible = true;
                dgvMain.Columns[4].HeaderText = "Контрагент поставщик";
                dgvMain.Columns[4].Visible = true;
            }
            if (CurrGoodsRecType == GoodsRecType.ShippedGoods)
            {
                lblCaption.Text = "Журнал отгрузки (продажи) товаров";

                dgvMain.Columns[1].HeaderText = "Цена продажи";
                dgvMain.Columns[1].Visible = true;
                dgvMain.Columns[2].HeaderText = "Дата продажи";
                dgvMain.Columns[2].Visible = true;
                dgvMain.Columns[4].HeaderText = "Контрагент покупатель";
                dgvMain.Columns[4].Visible = true;
            }
            if (CurrGoodsRecType == GoodsRecType.StoredGoods)
            {
                lblCaption.Text = "Журнал товаров в магазине (на складе)";
                dgvMain.Columns[1].Visible = false;
                dgvMain.Columns[2].Visible = false;
                dgvMain.Columns[4].Visible = false;
            }

            //  обновляем грида
            dgvMain.AutoGenerateColumns = false;
            dgvMain.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvMain.MultiSelect = false;
            dgvMain.DataSource = _grList;

            // обновляем вид кнопок
            if (_grList == null)
            {
                btnCreate.Enabled = false;
                btnUpdate.Enabled = false;
                btnDelete.Enabled = false;
            }
            else
            {
                btnCreate.Enabled = true;
                if (_grList.Count <= 0)
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

            // добудим объект для стирания по иду из грида
            DataGridViewRow selRow = dgvMain.SelectedRows[0];
            Int32 Id = (Int32)(selRow.Cells["colId"].Value);
            GoodsRecord currGR = _currBL.ReadGoodsRecordById(Id);

            BusinessLogicHandler.GetBL().DeleteGoodsRecord(currGR);

            RefreshGridAndButtons();
        }

        private void btnCreate_Click(object sender, EventArgs e)
        {
            GoodsRecordEditForm _editForm = new GoodsRecordEditForm();
            _editForm.IsNew = true;
            _editForm.CurrGoodsRecordsListUserControl = this;
            _editForm.ShowDialog();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (dgvMain.SelectedRows.Count <= 0) return;

            // добудим объект для изменения по иду из грида
            DataGridViewRow selRow = dgvMain.SelectedRows[0];
            Int32 Id = (Int32)(selRow.Cells["colId"].Value);
            GoodsRecord currGR = _currBL.ReadGoodsRecordById(Id);

            GoodsRecordEditForm _editForm = new GoodsRecordEditForm();
            _editForm.IsNew = false;
            _editForm.CurrGoodsRecord = currGR;
            _editForm.CurrGoodsRecordsListUserControl = this;
            _editForm.ShowDialog();
        }
    }
}
