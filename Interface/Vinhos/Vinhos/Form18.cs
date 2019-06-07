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
    public partial class Form18 : Form
    {
        private String s = "data source=tcp:mednat.ieeta.pt\\SQLSERVER,8101;DATABASE=p8g6;UID=p8g6;PASSWORD=123Joao@Bruno";
        SqlConnection cn;
        int id;
        public Form18(int ss)
        {
            InitializeComponent();
            id = ss;
        }

        private void Form18_Load(object sender, EventArgs e)
        {
            update();
        }
        private void update()
        {
            int i = 0;
            cn = new SqlConnection(s);
            SqlCommand command = new SqlCommand();
            command.CommandText = "exec Vinhos.ConcursoPremios @ID";
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
                        if (i == 0)
                        {
                            richTextBox2.Text = reader.GetString(0);
                            richTextBox2.SelectionAlignment = HorizontalAlignment.Center;
                            richTextBox5.Text = reader.GetString(2);
                            richTextBox1.Text = reader.GetString(4);
                            richTextBox1.SelectionAlignment = HorizontalAlignment.Center;
                            int x = (int)reader.GetInt32(5);
                            button2.Click += (sender, args) =>
                            {
                                Form3 form = new Form3(x);
                                form.Location = this.Location;
                                form.StartPosition = FormStartPosition.Manual;
                                form.FormClosing += delegate { this.Show(); };
                                form.Show();
                                this.Hide();
                            };

                        }
                        else if (i == 2)
                        {
                            richTextBox3.Text = reader.GetString(4);
                            richTextBox3.SelectionAlignment = HorizontalAlignment.Center;
                            int x = (int)reader.GetInt32(5);
                            button3.Click += (sender, args) =>
                            {
                                Form3 form = new Form3(x);
                                form.Location = this.Location;
                                form.StartPosition = FormStartPosition.Manual;
                                form.FormClosing += delegate { this.Show(); };
                                form.Show();
                                this.Hide();
                            };
                        }
                        else
                        {
                            richTextBox4.SelectionAlignment = HorizontalAlignment.Center;
                            richTextBox4.Text = reader.GetString(4);
                            int x = (int)reader.GetInt32(5);
                            button5.Click += (sender, args) =>
                            {
                                Form3 form = new Form3(x);
                                form.Location = this.Location;
                                form.StartPosition = FormStartPosition.Manual;
                                form.FormClosing += delegate { this.Show(); };
                                form.Show();
                                this.Hide();
                            };
                        }
                        i=i + 1;
                        
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
        
        private void richTextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void richTextBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {

        }
    }
}
