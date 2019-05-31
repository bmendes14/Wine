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
 

    public partial class Form1 : Form
    {
        private String sa = "data source=JOAOECT\\SQLEXPRESS;integrated security=true;initial catalog=VinhosDatabase";
        SqlConnection cn;
        int i = 0;

        public Form1()
        {
            InitializeComponent();
        }


        private void panel4_Paint(object sender, PaintEventArgs e)
        {
            cn = new SqlConnection(sa);
            SqlCommand command = new SqlCommand();
            command.CommandText = "exec Vinhos.CountWines";
            command.Connection = cn;
            cn.Open();
            try
            {
                command.ExecuteNonQuery();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    { 
                        Random r = new Random();
                        i = r.Next(0,reader.GetInt32(0));
                    }
                }


            }
            catch (Exception ex)
            {
                throw new Exception("Failed to load");
            }

            command.CommandText = "exec Vinhos.getRandom @ID";
            command.Parameters.Clear();
            command.Parameters.Add("@ID", SqlDbType.Int);
            command.Parameters["@ID"].Value = i;
            command.Connection = cn;
            try
            {
                command.ExecuteNonQuery();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        richTextBox2.Text = reader.GetString(0);
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

        private void textBox8_TextChanged(object sender, EventArgs e)
        {

        }

        private void button3_Click_1(object sender, EventArgs e)
        {
            Form2 form = new Form2();
            form.Location = this.Location;
            form.StartPosition = FormStartPosition.Manual;
            form.FormClosing += delegate { this.Show(); };
            form.Show();
            this.Hide();
            
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void toolTip1_Popup(object sender, PopupEventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void richTextBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
