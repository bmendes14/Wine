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
    public partial class Form17 : Form
    {
        private String s = "data source=tcp:mednat.ieeta.pt\\SQLSERVER,8101;DATABASE=p8g6;UID=p8g6;PASSWORD=123Joao@Bruno";
        SqlConnection cn;

        public Form17()
        {
            InitializeComponent();
            cn = new SqlConnection(s);
        }

        bool f = true;
        private void panel3_Paint(object sender, PaintEventArgs e)
        {
            if (f)
            {
                update();
                f = false;
            }

        }

        private void update()
        {
            panel3.Controls.Clear();
            String sql = "select * from Vinhos.ConcursoName() ";
            int x = 50;
            int y = 30;
            cn.Open();
            using (SqlCommand command = new SqlCommand(sql, cn))
            {

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {

                        addTemplate(new Point(x, y), reader.GetString(2), reader.GetInt32(1));
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

        // Template
        private void addTemplate(Point pp, String wine, int number)
        {

            Panel p = new Panel();
            Button b = new Button();
            RichTextBox t = new RichTextBox();

            b.Location = new Point(35, 13);
            b.Size = new Size(58, 102);
            b.BackColor = Color.Transparent;
            b.FlatStyle = FlatStyle.Flat;
            b.FlatAppearance.BorderSize = 0;
            b.BackgroundImage = Vinhos.Properties.Resources.asdasdasdasd;
            b.ImageAlign = ContentAlignment.MiddleCenter;
            b.BackgroundImageLayout = ImageLayout.Zoom;


            b.Click += (sender, args) =>
            {
                Form18 form = new Form18(number);
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
            t.Size = new Size(115, 59);
            t.Font = new Font("Arial", 8, FontStyle.Regular);
            t.WordWrap = true;
            if (aux.Length == 1)
            {
                t.Text = aux[0];
            }
            else
            {
                String s = aux[0] + ' ' + aux[1];
                String s2 = "";

                for (int i = 2; i < aux.Length; i++)
                {
                    s2 = s2 + " " + aux[i];

                }

                t.Text = s + Environment.NewLine + s2;

            }


            p.BackColor = Color.Gray;
            p.Location = pp;
            p.BorderStyle = BorderStyle.Fixed3D;
            p.Size = new Size(129, 185);


            p.Controls.Add(b);
            p.Controls.Add(t);


            panel3.Controls.Add(p);

        }
    }
}
