using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace Vinhos
{
    public partial class Form4 : Form
    {
        private String sa = "data source=JOAOECT\\SQLEXPRESS;integrated security=true;initial catalog=VinhosDatabase";
        SqlConnection cn;
        int i = 0;
        private String nome;
        private String Morada;
        private int TamanhoProducao;
        private String descricao;
        private String telefone;
        private int ID;
        private int RegiaoID;



        public Form4()
        {
            InitializeComponent();
        }
        private void Form4_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection(sa);

        }

        Boolean f = true;

        private void panel3_Paint(object sender, PaintEventArgs e)
        {
            
            if (f)
            {
                normal();
                f = false;
            }
        }

        private void normal()
        {
            panel3.Controls.Clear();
            String sql = "exec Vinhos.QuintaName";
            int x = 50;
            int y = 30;
            cn.Close();
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
        }
        private void addTemplate(Point pp, String wine, int number)
        {

            Panel p = new Panel();
            Button b = new Button();
            RichTextBox t = new RichTextBox();

            b.Location = new Point(15, 5);
            b.Size = new Size(100, 100);
            b.BackColor = Color.Transparent;
            b.FlatStyle = FlatStyle.Flat;
            b.FlatAppearance.BorderSize = 0;
            b.BackgroundImage = Vinhos.Properties.Resources._5a2dd43f60fd27_4999223615129528953973;
            b.ImageAlign = ContentAlignment.MiddleCenter;
            b.BackgroundImageLayout = ImageLayout.Zoom;


            b.Click += (sender, args) =>
            {
                Form5 form = new Form5(number);
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
            t.Font = new Font("Arial", 11, FontStyle.Regular);
            t.WordWrap = true;
            String s = aux[0] + ' ' + aux[1];
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


            panel3.Controls.Add(p);



        }


        private void checkBox3_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox3.Checked)
            {
                panel3.Controls.Clear();
                SqlCommand command = new SqlCommand();
                command.CommandText = "exec Vinhos.Quinta1 @ID";
                command.Parameters.Clear();
                command.Parameters.Add("@ID", SqlDbType.Int);
                command.Parameters["@ID"].Value = 2;
                command.Connection = cn;
                int x = 50;
                int y = 30;
                cn.Close();
                cn.Open();
                try
                {
                    command.ExecuteNonQuery();
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
                catch (Exception ex)
                {
                    throw new Exception("Failed to load");
                }
                finally
                {
                    cn.Close();
                }


                checkBox2.Enabled = false;
                checkBox4.Enabled = false;
                checkBox5.Enabled = false;
                checkBox6.Enabled = false;

            }
            else
            {
                checkBox2.Enabled = true;
                checkBox4.Enabled = true;
                checkBox5.Enabled = true;
                checkBox6.Enabled = true;
                normal();

            }
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            
            if (checkBox2.Checked)
            {
                panel3.Controls.Clear();
                SqlCommand command = new SqlCommand();
                command.CommandText = "exec Vinhos.Quinta1 @ID";
                command.Parameters.Clear();
                command.Parameters.Add("@ID", SqlDbType.Int);
                command.Parameters["@ID"].Value = 1;
                command.Connection = cn;
                int x = 50;
                int y = 30;
                cn.Close();
                cn.Open();
                try
                {
                    command.ExecuteNonQuery();
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
                catch (Exception ex)
                {
                    throw new Exception("Failed to load");
                }
                finally
                {
                    cn.Close();
                }


                checkBox3.Enabled = false;
                checkBox4.Enabled = false;
                checkBox5.Enabled = false;
                checkBox6.Enabled = false;

            }
            else
            {
                checkBox3.Enabled = true;
                checkBox4.Enabled = true;
                checkBox5.Enabled = true;
                checkBox6.Enabled = true;
                normal();

            }
        }
        private void checkBox4_CheckedChanged_1(object sender, EventArgs e)
        {
            if (checkBox4.Checked)
            {
                panel3.Controls.Clear();
                SqlCommand command = new SqlCommand();
                command.CommandText = "exec Vinhos.Quinta1 @ID";
                command.Parameters.Clear();
                command.Parameters.Add("@ID", SqlDbType.Int);
                command.Parameters["@ID"].Value = 3;
                command.Connection = cn;
                int x = 50;
                int y = 30;
                cn.Close();
                cn.Open();
                try
                {
                    command.ExecuteNonQuery();
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
                catch (Exception ex)
                {
                    throw new Exception("Failed to load");
                }
                finally
                {
                    cn.Close();
                }


                checkBox3.Enabled = false;
                checkBox2.Enabled = false;
                checkBox5.Enabled = false;
                checkBox6.Enabled = false;

            }
            else
            {
                checkBox3.Enabled = true;
                checkBox2.Enabled = true;
                checkBox5.Enabled = true;
                checkBox6.Enabled = true;
                normal();

            }
        }







        // Never used
        private void textBox1_TextChanged(object sender, EventArgs e) { }
        private void panel4_Paint(object sender, PaintEventArgs e)
        {

        }
        private void panel1_Paint(object sender, PaintEventArgs e) { }
        private void button1_Click(object sender, EventArgs e)
        {
        }
        private void button2_Click(object sender, EventArgs e)
        {

        }
        private void textBox1_TextChanged_1(object sender, EventArgs e)
        {

        }
        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

    
    }
}
