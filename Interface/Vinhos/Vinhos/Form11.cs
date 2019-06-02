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
    public partial class Form11 : Form
    {
        private String s = "data source=JOAOECT\\SQLEXPRESS;integrated security=true;initial catalog=VinhosDatabase";
        SqlConnection cn;
        int id;

        public Form11(int si)
        {
            InitializeComponent();
            cn = new SqlConnection(s);
            id = si;
        }

        bool f = true;
        private void panel3_Paint(object sender, PaintEventArgs e)
        {

            if (f)
            {
                update();
                richTextBox2.SelectionAlignment = HorizontalAlignment.Center;
            }
        }

        private void update()
        {
            panel3.Controls.Clear();
            cn = new SqlConnection(s);
                int x = 50;
                int y = 30;
                SqlCommand command = new SqlCommand();
                command.CommandText = "select * from  Vinhos.CastasAssociadaVinho(@ID)";
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
                        if (reader.HasRows) { 
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
                }
                catch (Exception ex)
                {
                    throw new Exception("Failed to load");
                }
                finally
                {
                    cn.Close();
                }

                f = false;

                Button b = new Button();
                if (x == 50)
                {
                    b.Location = new Point(254, y );
                }
                else
                {
                    b.Location = new Point(260, y + 200);
                }
                b.Text = "Add Casta";
                b.Size = new Size(117, 47);
                b.BackColor = Color.White;
                panel3.Controls.Add(b);

                b.Click += (ss, args) =>
                {
                    Form12 form = new Form12(id);
                    form.Location = this.Location;
                    form.StartPosition = FormStartPosition.Manual;
                    form.FormClosing += delegate { update(); this.Show(); };
                    form.Show();
                    this.Hide();
                };


                cn = new SqlConnection(s);
                command = new SqlCommand();
                command.CommandText = "select * from Vinhos.WineCaracteristics(@ID)";
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
                            richTextBox2.Text= reader.GetString(0);
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
            Button b2 = new Button();
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
            t.Size = new Size(115, 30);
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

            b2.Location = new Point(30, 160);
            b2.Size = new Size(70, 20);
            b2.Text = "Remove";
            b2.BackColor = Color.White;
            b2.BringToFront();


            b2.Click += (sender, args) =>
            {
                SqlCommand command = new SqlCommand();
                command.CommandText = "exec Vinhos.DeleteCastaWineAssociation @VinhoID, @CastaID";
                command.Parameters.Clear();
                command.Parameters.Add("@VinhoID", SqlDbType.Int);
                command.Parameters["@VinhoID"].Value = id;
                command.Parameters.Add("@CastaID", SqlDbType.Int);
                command.Parameters["@CastaID"].Value = number;
                command.Connection = cn;
                cn.Open();
                try
                {
                    command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw new Exception("Failed to load");
                }
                finally
                {
                    cn.Close();
                }
                update();
            };
               
            p.BackColor = Color.Gray;
            p.Location = pp;
            p.BorderStyle = BorderStyle.Fixed3D;
            p.Size = new Size(129, 185);


            p.Controls.Add(b);
            p.Controls.Add(t);
            p.Controls.Add(b2);


            panel3.Controls.Add(p);



        }

        private void richTextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
