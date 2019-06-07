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
    public partial class Form19 : Form
    {
        int id;
        SqlConnection cn;
        private String sa = "data source=tcp:mednat.ieeta.pt\\SQLSERVER,8101;DATABASE=p8g6;UID=p8g6;PASSWORD=123Joao@Bruno";
        public Form19(int i)
        {
            InitializeComponent();
            id = i;
        }

        private void Form19_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection(sa);
            SqlCommand command = new SqlCommand();
            command.CommandText = "select * from Vinhos.GetDis(@ID)";
            command.Parameters.Clear();
            command.Parameters.Add("@ID", SqlDbType.Int);
            command.Parameters["@ID"].Value = id;
            command.Connection = cn;
            richTextBox1.Text = id + "";
            cn.Open();
            try
            {
                command.ExecuteNonQuery();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        richTextBox1.Text = reader.GetString(0);
                        richTextBox3.Text = reader.GetString(1);

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

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
