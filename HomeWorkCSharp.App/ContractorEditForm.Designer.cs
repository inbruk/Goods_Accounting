namespace HomeWorkCSharp.App
{
    partial class ContractorEditForm
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
            this.tbxPhone = new System.Windows.Forms.TextBox();
            this.tbxName = new System.Windows.Forms.TextBox();
            this.lblPhone = new System.Windows.Forms.Label();
            this.lblName = new System.Windows.Forms.Label();
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.tbxEMail = new System.Windows.Forms.TextBox();
            this.lblEMail = new System.Windows.Forms.Label();
            this.lblContrType = new System.Windows.Forms.Label();
            this.cbxContractorType = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // tbxPhone
            // 
            this.tbxPhone.Location = new System.Drawing.Point(91, 66);
            this.tbxPhone.Name = "tbxPhone";
            this.tbxPhone.Size = new System.Drawing.Size(203, 20);
            this.tbxPhone.TabIndex = 11;
            // 
            // tbxName
            // 
            this.tbxName.Location = new System.Drawing.Point(91, 40);
            this.tbxName.Name = "tbxName";
            this.tbxName.Size = new System.Drawing.Size(203, 20);
            this.tbxName.TabIndex = 10;
            // 
            // lblPhone
            // 
            this.lblPhone.AutoSize = true;
            this.lblPhone.Location = new System.Drawing.Point(35, 69);
            this.lblPhone.Name = "lblPhone";
            this.lblPhone.Size = new System.Drawing.Size(58, 13);
            this.lblPhone.TabIndex = 9;
            this.lblPhone.Text = "Телефон :";
            // 
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.Location = new System.Drawing.Point(30, 43);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(63, 13);
            this.lblName.TabIndex = 8;
            this.lblName.Text = "Название :";
            // 
            // btnCancel
            // 
            this.btnCancel.Location = new System.Drawing.Point(178, 124);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(116, 23);
            this.btnCancel.TabIndex = 7;
            this.btnCancel.Text = "Отменить";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnSave
            // 
            this.btnSave.Location = new System.Drawing.Point(33, 124);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(128, 23);
            this.btnSave.TabIndex = 6;
            this.btnSave.Text = "Сохранить";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // tbxEMail
            // 
            this.tbxEMail.Location = new System.Drawing.Point(91, 92);
            this.tbxEMail.Name = "tbxEMail";
            this.tbxEMail.Size = new System.Drawing.Size(203, 20);
            this.tbxEMail.TabIndex = 13;
            // 
            // lblEMail
            // 
            this.lblEMail.AutoSize = true;
            this.lblEMail.Location = new System.Drawing.Point(35, 95);
            this.lblEMail.Name = "lblEMail";
            this.lblEMail.Size = new System.Drawing.Size(57, 13);
            this.lblEMail.TabIndex = 12;
            this.lblEMail.Text = "Эл. почта:";
            // 
            // lblContrType
            // 
            this.lblContrType.AutoSize = true;
            this.lblContrType.Location = new System.Drawing.Point(29, 17);
            this.lblContrType.Name = "lblContrType";
            this.lblContrType.Size = new System.Drawing.Size(98, 13);
            this.lblContrType.TabIndex = 14;
            this.lblContrType.Text = "Тип контрагента :";
            // 
            // cbxContractorType
            // 
            this.cbxContractorType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbxContractorType.FormattingEnabled = true;
            this.cbxContractorType.Items.AddRange(new object[] {
            "Поставщик",
            "Покупатель"});
            this.cbxContractorType.Location = new System.Drawing.Point(133, 13);
            this.cbxContractorType.Name = "cbxContractorType";
            this.cbxContractorType.Size = new System.Drawing.Size(160, 21);
            this.cbxContractorType.TabIndex = 15;
            // 
            // ContractorEditForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(332, 159);
            this.Controls.Add(this.cbxContractorType);
            this.Controls.Add(this.lblContrType);
            this.Controls.Add(this.tbxEMail);
            this.Controls.Add(this.lblEMail);
            this.Controls.Add(this.tbxPhone);
            this.Controls.Add(this.tbxName);
            this.Controls.Add(this.lblPhone);
            this.Controls.Add(this.lblName);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.btnSave);
            this.Name = "ContractorEditForm";
            this.Text = "Редактирование контрагента";
            this.Shown += new System.EventHandler(this.FormShown);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox tbxPhone;
        private System.Windows.Forms.TextBox tbxName;
        private System.Windows.Forms.Label lblPhone;
        private System.Windows.Forms.Label lblName;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.TextBox tbxEMail;
        private System.Windows.Forms.Label lblEMail;
        private System.Windows.Forms.Label lblContrType;
        private System.Windows.Forms.ComboBox cbxContractorType;
    }
}