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


    public partial class Form2 : Form
    {
        private String s = "data source=JOAOECT\\SQLEXPRESS;integrated security=true;initial catalog=VinhosDatabase";
        SqlConnection cn;

        public Form2()
        {
            InitializeComponent();

        }

        private void Form2_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection(s);

           
        }

        Boolean f = true;

        private void panel3_Paint(object sender, PaintEventArgs e)
        {
            String sql = "select * from Vinhos.WineName()";
            int x = 50;
            int y = 30;
            cn.Close();
            cn.Open();
            if (f)
           {
                using (SqlCommand command = new SqlCommand(sql, cn))
                {

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                       
                        addTemplate(new Point(x, y), reader.GetString(0),reader.GetInt32(1));
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

           f = false;
        }
    }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void panel4_Paint(object sender, PaintEventArgs e)
        {
            
        }

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
            b.BackgroundImage = Vinhos.Properties.Resources.vinhaça;
            b.ImageAlign = ContentAlignment.MiddleCenter;
            b.BackgroundImageLayout = ImageLayout.Zoom;


            b.Click += (sender, args) =>
            {
                Form3 form = new Form3(number);
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
             p.Location=pp;
             p.BorderStyle = BorderStyle.Fixed3D;
             p.Size = new Size(129, 185);


             p.Controls.Add(b);
             p.Controls.Add(t);


            panel3.Controls.Add(p);
            


        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
        }

        private void button2_Click(object sender, EventArgs e)
        {
            panel3.Controls.Clear();
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
                Form9 form = new Form9();
                form.Location = this.Location;
                form.StartPosition = FormStartPosition.Manual;
                form.FormClosing += delegate { this.Show(); };
                form.Show();
                this.Hide();
        }
    }
}
