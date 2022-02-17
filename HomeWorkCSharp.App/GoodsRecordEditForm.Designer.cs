namespace HomeWorkCSharp.App
{
    partial class GoodsRecordEditForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.cbxRecordType = new System.Windows.Forms.ComboBox();
            this.lblType = new System.Windows.Forms.Label();
            this.lblGoodsName = new System.Windows.Forms.Label();
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.lblContractor = new System.Windows.Forms.Label();
            this.tbxAmount = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.cbxGoodsName = new System.Windows.Forms.ComboBox();
            this.cbxContractorName = new System.Windows.Forms.ComboBox();
            this.lblActionDateTime = new System.Windows.Forms.Label();
            this.tbxActionDateTime = new System.Windows.Forms.TextBox();
            this.lblActionPrice = new System.Windows.Forms.Label();
            this.tbxActionPrice = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // cbxRecordType
            // 
            this.cbxRecordType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbxRecordType.FormattingEnabled = true;
            this.cbxRecordType.Items.AddRange(new object[] {
            "закупки товаров",
            "хранения товаров ",
            "продажи товаров"});
            this.cbxRecordType.Location = new System.Drawing.Point(134, 12);
            this.cbxRecordType.Name = "cbxRecordType";
            this.cbxRecordType.Size = new System.Drawing.Size(203, 21);
            this.cbxRecordType.TabIndex = 25;
            // 
            // lblType
            // 
            this.lblType.AutoSize = true;
            this.lblType.Location = new System.Drawing.Point(50, 16);
            this.lblType.Name = "lblType";
            this.lblType.Size = new System.Drawing.Size(78, 13);
            this.lblType.TabIndex = 24;
            this.lblType.Text = "Тип журнала :";
            // 
            // lblGoodsName
            // 
            this.lblGoodsName.AutoSize = true;
            this.lblGoodsName.Location = new System.Drawing.Point(81, 45);
            this.lblGoodsName.Name = "lblGoodsName";
            this.lblGoodsName.Size = new System.Drawing.Size(47, 13);
            this.lblGoodsName.TabIndex = 18;
            this.lblGoodsName.Text = "Товар  :";
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(206, 188);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(131, 23);
            this.btnCancel.TabIndex = 17;
            this.btnCancel.Text = "Отменить";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnSave
            // 
            this.btnSave.Location = new System.Drawing.Point(53, 188);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(136, 23);
            this.btnSave.TabIndex = 16;
            this.btnSave.Text = "Сохранить";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // lblContractor
            // 
            this.lblContractor.AutoSize = true;
            this.lblContractor.Location = new System.Drawing.Point(57, 74);
            this.lblContractor.Name = "lblContractor";
            this.lblContractor.Size = new System.Drawing.Size(71, 13);
            this.lblContractor.TabIndex = 26;
            this.lblContractor.Text = "Контрагент :";
            // 
            // tbxAmount
            // 
            this.tbxAmount.Location = new System.Drawing.Point(134, 100);
            this.tbxAmount.Name = "tbxAmount";
            this.tbxAmount.Size = new System.Drawing.Size(203, 20);
            this.tbxAmount.TabIndex = 27;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(57, 103);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(72, 13);
            this.label2.TabIndex = 28;
            this.label2.Text = "Количество :";
            // 
            // cbxGoodsName
            // 
            this.cbxGoodsName.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbxGoodsName.FormattingEnabled = true;
            this.cbxGoodsName.Location = new System.Drawing.Point(134, 42);
            this.cbxGoodsName.Name = "cbxGoodsName";
            this.cbxGoodsName.Size = new System.Drawing.Size(203, 21);
            this.cbxGoodsName.TabIndex = 29;
            // 
            // cbxContractorName
            // 
            this.cbxContractorName.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbxContractorName.FormattingEnabled = true;
            this.cbxContractorName.Location = new System.Drawing.Point(134, 71);
            this.cbxContractorName.Name = "cbxContractorName";
            this.cbxContractorName.Size = new System.Drawing.Size(203, 21);
            this.cbxContractorName.TabIndex = 30;
            // 
            // lblActionDateTime
            // 
            this.lblActionDateTime.AutoSize = true;
            this.lblActionDateTime.Location = new System.Drawing.Point(45, 160);
            this.lblActionDateTime.Name = "lblActionDateTime";
            this.lblActionDateTime.Size = new System.Drawing.Size(83, 13);
            this.lblActionDateTime.TabIndex = 32;
            this.lblActionDateTime.Text = "Дата и время :";
            // 
            // tbxActionDateTime
            // 
            this.tbxActionDateTime.Location = new System.Drawing.Point(134, 157);
            this.tbxActionDateTime.Name = "tbxActionDateTime";
            this.tbxActionDateTime.Size = new System.Drawing.Size(203, 20);
            this.tbxActionDateTime.TabIndex = 31;
            // 
            // lblActionPrice
            // 
            this.lblActionPrice.AutoSize = true;
            this.lblActionPrice.Location = new System.Drawing.Point(90, 131);
            this.lblActionPrice.Name = "lblActionPrice";
            this.lblActionPrice.Size = new System.Drawing.Size(39, 13);
            this.lblActionPrice.TabIndex = 34;
            this.lblActionPrice.Text = "Цена :";
            // 
            // tbxActionPrice
            // 
            this.tbxActionPrice.Location = new System.Drawing.Point(134, 128);
            this.tbxActionPrice.Name = "tbxActionPrice";
            this.tbxActionPrice.Size = new System.Drawing.Size(203, 20);
            this.tbxActionPrice.TabIndex = 33;
            // 
            // GoodsRecordEditForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(371, 223);
            this.Controls.Add(this.lblActionPrice);
            this.Controls.Add(this.tbxActionPrice);
            this.Controls.Add(this.lblActionDateTime);
            this.Controls.Add(this.tbxActionDateTime);
            this.Controls.Add(this.cbxContractorName);
            this.Controls.Add(this.cbxGoodsName);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.tbxAmount);
            this.Controls.Add(this.lblContractor);
            this.Controls.Add(this.cbxRecordType);
            this.Controls.Add(this.lblType);
            this.Controls.Add(this.lblGoodsName);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnSave);
            this.Name = "GoodsRecordEditForm";
            this.Text = "Редактирование записи журнала";
            this.Shown += new System.EventHandler(this.FormShown);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox cbxRecordType;
        private System.Windows.Forms.Label lblType;
        private System.Windows.Forms.Label lblGoodsName;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.Label lblContractor;
        private System.Windows.Forms.TextBox tbxAmount;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cbxGoodsName;
        private System.Windows.Forms.ComboBox cbxContractorName;
        private System.Windows.Forms.Label lblActionDateTime;
        private System.Windows.Forms.TextBox tbxActionDateTime;
        private System.Windows.Forms.Label lblActionPrice;
        private System.Windows.Forms.TextBox tbxActionPrice;
    }
}