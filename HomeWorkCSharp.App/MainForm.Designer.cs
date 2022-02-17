namespace HomeWorkCSharp.App
{
    partial class MainForm
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
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.выходToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.поставленныеТоварыToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.товарыНаСкладевМагазинеToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.отгруженныепроданныеТоварыToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.контрагентыToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.поставщикиToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.покупателиToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.описанияТоваровToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.выходToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.ucGoodsDescriptionList = new HomeWorkCSharp.App.GoodsDescriptionList();
            this.ucContractorsList1 = new HomeWorkCSharp.App.ucContractorsList();
            this.ucGoodsRecordsList1 = new HomeWorkCSharp.App.ucGoodsRecordsList();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.выходToolStripMenuItem,
            this.контрагентыToolStripMenuItem,
            this.описанияТоваровToolStripMenuItem,
            this.выходToolStripMenuItem1});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(784, 24);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // выходToolStripMenuItem
            // 
            this.выходToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.поставленныеТоварыToolStripMenuItem,
            this.товарыНаСкладевМагазинеToolStripMenuItem,
            this.отгруженныепроданныеТоварыToolStripMenuItem});
            this.выходToolStripMenuItem.Name = "выходToolStripMenuItem";
            this.выходToolStripMenuItem.Size = new System.Drawing.Size(152, 20);
            this.выходToolStripMenuItem.Text = "Журналы учета товаров";
            // 
            // поставленныеТоварыToolStripMenuItem
            // 
            this.поставленныеТоварыToolStripMenuItem.Name = "поставленныеТоварыToolStripMenuItem";
            this.поставленныеТоварыToolStripMenuItem.Size = new System.Drawing.Size(266, 22);
            this.поставленныеТоварыToolStripMenuItem.Text = "Поставленные товары";
            this.поставленныеТоварыToolStripMenuItem.Click += new System.EventHandler(this.SuppliedGoods_MenuItem_Click);
            // 
            // товарыНаСкладевМагазинеToolStripMenuItem
            // 
            this.товарыНаСкладевМагазинеToolStripMenuItem.Name = "товарыНаСкладевМагазинеToolStripMenuItem";
            this.товарыНаСкладевМагазинеToolStripMenuItem.Size = new System.Drawing.Size(266, 22);
            this.товарыНаСкладевМагазинеToolStripMenuItem.Text = "Товары на складе (в магазине)";
            this.товарыНаСкладевМагазинеToolStripMenuItem.Click += new System.EventHandler(this.StoredGoods_MenuItem_Click);
            // 
            // отгруженныепроданныеТоварыToolStripMenuItem
            // 
            this.отгруженныепроданныеТоварыToolStripMenuItem.Name = "отгруженныепроданныеТоварыToolStripMenuItem";
            this.отгруженныепроданныеТоварыToolStripMenuItem.Size = new System.Drawing.Size(266, 22);
            this.отгруженныепроданныеТоварыToolStripMenuItem.Text = "Отгруженные (проданные) товары";
            this.отгруженныепроданныеТоварыToolStripMenuItem.Click += new System.EventHandler(this.ShippedGoods_MenuItem_Click);
            // 
            // контрагентыToolStripMenuItem
            // 
            this.контрагентыToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.поставщикиToolStripMenuItem,
            this.покупателиToolStripMenuItem});
            this.контрагентыToolStripMenuItem.Name = "контрагентыToolStripMenuItem";
            this.контрагентыToolStripMenuItem.Size = new System.Drawing.Size(90, 20);
            this.контрагентыToolStripMenuItem.Text = "Контрагенты";
            // 
            // поставщикиToolStripMenuItem
            // 
            this.поставщикиToolStripMenuItem.Name = "поставщикиToolStripMenuItem";
            this.поставщикиToolStripMenuItem.Size = new System.Drawing.Size(144, 22);
            this.поставщикиToolStripMenuItem.Text = "Поставщики";
            this.поставщикиToolStripMenuItem.Click += new System.EventHandler(this.Suppliers_MenuItem_Click);
            // 
            // покупателиToolStripMenuItem
            // 
            this.покупателиToolStripMenuItem.Name = "покупателиToolStripMenuItem";
            this.покупателиToolStripMenuItem.Size = new System.Drawing.Size(144, 22);
            this.покупателиToolStripMenuItem.Text = "Покупатели";
            this.покупателиToolStripMenuItem.Click += new System.EventHandler(this.Customers_MenuItem_Click);
            // 
            // описанияТоваровToolStripMenuItem
            // 
            this.описанияТоваровToolStripMenuItem.Name = "описанияТоваровToolStripMenuItem";
            this.описанияТоваровToolStripMenuItem.Size = new System.Drawing.Size(124, 20);
            this.описанияТоваровToolStripMenuItem.Text = "Описания товаров ";
            this.описанияТоваровToolStripMenuItem.Click += new System.EventHandler(this.GoodsDescriptionsShow_MenuClick);
            // 
            // выходToolStripMenuItem1
            // 
            this.выходToolStripMenuItem1.Name = "выходToolStripMenuItem1";
            this.выходToolStripMenuItem1.Size = new System.Drawing.Size(53, 20);
            this.выходToolStripMenuItem1.Text = "Выход";
            this.выходToolStripMenuItem1.Click += new System.EventHandler(this.Exit_MenuClick);
            // 
            // ucGoodsDescriptionList
            // 
            this.ucGoodsDescriptionList.Location = new System.Drawing.Point(3, 32);
            this.ucGoodsDescriptionList.Margin = new System.Windows.Forms.Padding(0);
            this.ucGoodsDescriptionList.Name = "ucGoodsDescriptionList";
            this.ucGoodsDescriptionList.Padding = new System.Windows.Forms.Padding(3);
            this.ucGoodsDescriptionList.Size = new System.Drawing.Size(781, 481);
            this.ucGoodsDescriptionList.TabIndex = 1;
            // 
            // ucContractorsList1
            // 
            this.ucContractorsList1.CurrContrType = HomeWorkCSharp.Classes.ContrType.Supplier;
            this.ucContractorsList1.Location = new System.Drawing.Point(3, 32);
            this.ucContractorsList1.Margin = new System.Windows.Forms.Padding(0);
            this.ucContractorsList1.Name = "ucContractorsList1";
            this.ucContractorsList1.Size = new System.Drawing.Size(775, 478);
            this.ucContractorsList1.TabIndex = 2;
            // 
            // ucGoodsRecordsList1
            // 
            this.ucGoodsRecordsList1.CurrGoodsRecType = HomeWorkCSharp.Classes.GoodsRecType.SuppliedGoods;
            this.ucGoodsRecordsList1.Location = new System.Drawing.Point(3, 32);
            this.ucGoodsRecordsList1.Margin = new System.Windows.Forms.Padding(0);
            this.ucGoodsRecordsList1.Name = "ucGoodsRecordsList1";
            this.ucGoodsRecordsList1.Size = new System.Drawing.Size(775, 478);
            this.ucGoodsRecordsList1.TabIndex = 3;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(784, 511);
            this.Controls.Add(this.ucGoodsRecordsList1);
            this.Controls.Add(this.ucContractorsList1);
            this.Controls.Add(this.ucGoodsDescriptionList);
            this.Controls.Add(this.menuStrip1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "MainForm";
            this.Text = "Учет товаров в магазине";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem выходToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem поставленныеТоварыToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem товарыНаСкладевМагазинеToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem отгруженныепроданныеТоварыToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem контрагентыToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem поставщикиToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem покупателиToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem описанияТоваровToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem выходToolStripMenuItem1;
        private GoodsDescriptionList ucGoodsDescriptionList;
        private ucContractorsList ucContractorsList1;
        private ucGoodsRecordsList ucGoodsRecordsList1;
    }
}

