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
    public partial class Form16 : Form
    {
        int id;
        private String sa = "data source=tcp:mednat.ieeta.pt\\SQLSERVER,8101;DATABASE=p8g6;UID=p8g6;PASSWORD=123Joao@Bruno";
        SqlConnection cn;


        public Form16(int s)
        {
            InitializeComponent();
            id = s;
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void Form16_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection(sa);
            SqlCommand command = new SqlCommand();
            command.CommandText = "select * from Vinhos.EnologoNames(@ID)";
            command.Parameters.Clear();
            command.Parameters.Add("@ID", SqlDbType.Int);
            command.Parameters["@ID"].Value = id;
            command.Connection = cn;
            cn.Open();
            try
            {
                command.ExecuteNonQuery();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        richTextBox2.Text = reader.GetString(2);
                        richTextBox2.SelectionAlignment = HorizontalAlignment.Center;
                       richTextBox3.Text = "Nº de Participações: " + reader.GetInt32(0);
                        richTextBox1.Text = "Nº de Sócio: " + reader.GetInt32(1);
                        richTextBox4.Text = "Data de Nascimento: " + reader.GetDateTime(3);
                        richTextBox5.Text = "NIF: " + reader.GetString(4);

                    }
                }

            }
            catch (Exception ex)
            {
                throw new Exception("Failed to load");
            }
            finally
            {
                cn.Close();
            }

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void richTextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox5_TextChanged(object sender, EventArgs e)
        {

        }
        //update interface
        private void update()
        {
            panel3.Controls.Clear();
           int x = 50;
            int y = 30;
            cn = new SqlConnection(sa);
            SqlCommand command = new SqlCommand();
            command.CommandText = "select * from Vinhos.EnologoAssociatioWine(@ID)";
            command.Parameters.Clear();
            command.Parameters.Add("@ID", SqlDbType.Int);
            command.Parameters["@ID"].Value = id;
            command.Connection = cn;
            cn.Open();
            try
            {
                command.ExecuteNonQuery();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                       addTemplate(new Point(x, y), reader.GetString(0), reader.GetInt32(1));

                        x = x + 204;
                    }
                }

            }
            catch (Exception ex)
            {
                throw new Exception("Failed to load");
            }
            finally
            {
                cn.Close();
            }
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
            p.Location = pp;
            p.BorderStyle = BorderStyle.Fixed3D;
            p.Size = new Size(129, 185);


            p.Controls.Add(b);
            p.Controls.Add(t);


            panel3.Controls.Add(p);

        }


        bool ff = true;
        private void panel3_Paint(object sender, PaintEventArgs e)
        {
            if (ff)
            {
                ff = false;
                update();
            }

        }
    }
}
