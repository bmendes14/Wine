using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Vinhos
{
    public partial class Form6 : Form
    {
        private String s = "data source=JOAOECT\\SQLEXPRESS;integrated security=true;initial catalog=VinhosDatabase";
        SqlConnection cn;
        public Form6()
        {
            InitializeComponent();
        }

        private void Form6_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection(s);

        }

        //Bool aux to force first draw of interface
        Boolean f = true;
        //Template
        private void addTemplate(Point pp, String wine, int number)
        {

            Panel p = new Panel();
            Button b = new Button();
            RichTextBox t = new RichTextBox();

            b.Location = new Point(15, 13);
            b.Size = new Size(100, 102);
            b.BackColor = Color.Transparent;
            b.FlatStyle = FlatStyle.Flat;
            b.FlatAppearance.BorderSize = 0;
            b.BackgroundImage = Vinhos.Properties.Resources._03c8c134458037de51c64988ae9bdc46;
            b.ImageAlign = ContentAlignment.MiddleCenter;
            b.BackgroundImageLayout = ImageLayout.Zoom;


            b.Click += (sender, args) =>
            {
                Form7 form = new Form7(number);
                form.Location = this.Location;
                form.StartPosition = FormStartPosition.Manual;
                form.FormClosing += delegate { this.Show(); };
                form.Show();
                this.Hide();
            };

            String[] aux = wine.Split(' ');


            t.Location = new Point(9, 122);
            t.BackColor = Color.Gray;
            t.BorderStyle = BorderStyle.None;
            t.SelectionAlignment = HorizontalAlignment.Center;
            t.Size = new Size(115, 30);
            t.Font = new Font("Arial", 8, FontStyle.Regular);
            t.WordWrap = true;
            String s = aux[0];
            if (aux.Length >= 2)
            {
               s = aux[0] + ' ' + aux[1];
            }
            String s2 = "";

            for (int i = 2; i < aux.Length; i++)
            {
                s2 = s2 + " " + aux[i];

            }

            t.Text = s + Environment.NewLine + s2;


            p.BackColor = Color.Gray;
            p.Location = pp;
            p.BorderStyle = BorderStyle.Fixed3D;
            p.Size = new Size(129, 185);


            p.Controls.Add(b);
            p.Controls.Add(t);


            panel2.Controls.Add(p);
        }

        //Update Interface 
        private void update()
        {
            panel2.Controls.Clear();
            String sql = "select * from Vinhos.RegiaoName()";
            int x = 50;
            int y = 30;
            cn.Open();
            using (SqlCommand command = new SqlCommand(sql, cn))
            {

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {

                        addTemplate(new Point(x, y), reader.GetString(0), reader.GetInt32(1));
                        if (x == 458)
                        {
                            x = 50;
                            y = y + 222;
                        }
                        else
                        {
                            x = x + 204;
                        }

                    }
                }
            }
            cn.Close();

        }

        // paint painel first time
        private void panel2_Paint_1(object sender, PaintEventArgs e)
        {           
            if (f)
            {
                update();
                f = false;
            }
        }

        //New Regiao Button
        private void button1_Click(object sender, EventArgs e)
        {
            Form13 form = new Form13();
            form.Location = this.Location;
            form.StartPosition = FormStartPosition.Manual;
            form.FormClosing += delegate { update(); this.Show(); };
            form.Show();
            this.Hide();
        }

        //Never Used
        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
