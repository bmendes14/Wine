using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;

namespace Vinhos
{
    public partial class Form7 : Form
    {
        int s;
        private String sa = "data source=JOAOECT\\SQLEXPRESS;integrated security=true;initial catalog=VinhosDatabase";
        SqlConnection cn;
        public Form7( int i)
        {
            s = i;
            InitializeComponent();
        }

        private void Form7_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection(sa);
            SqlCommand command = new SqlCommand();
            command.CommandText = "select * from Vinhos.RegiaoInfo(@ID)";
            command.Parameters.Clear();
            command.Parameters.Add("@ID", SqlDbType.Int);
            command.Parameters["@ID"].Value = s;
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
                        richTextBox1.Text = "Solo: " + reader.GetString(0);
                        richTextBox3.Text = "Clima: " + reader.GetString(1);
                        richTextBox4.Text = "Codigo Postal: "+ reader.GetString(3);

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

        private void richTextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void richTextBox1_TextChanged_1(object sender, EventArgs e)
        {
                
        }
    }
}
