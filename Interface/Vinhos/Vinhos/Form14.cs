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
    public partial class Form14 : Form
    {

        //Variables
        String nome;
        String codigo;
        String solo;
        String clima;
        int id;

        private String sa = "data source=JOAOECT\\SQLEXPRESS;integrated security=true;initial catalog=VinhosDatabase";
        SqlConnection cn;

        public Form14(int s)
        {
            InitializeComponent();
            cn = new SqlConnection(sa);
            id = s;
        }

        bool f = true;
        private void Form14_Load(object sender, EventArgs e)
        {
            if (f)
            {
                cn = new SqlConnection(sa);
                SqlCommand command = new SqlCommand();
                command.CommandText = "select * from Vinhos.RegiaoInfo(@ID)";
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
                            richTextBox3.Text = reader.GetString(2);
                            richTextBox10.Text = reader.GetString(0);
                            richTextBox12.Text = reader.GetString(1);
                            richTextBox4.Text = reader.GetString(3);

                            solo = richTextBox10.Text;
                            clima = richTextBox12.Text;
                            codigo = richTextBox4.Text;
                            nome = richTextBox3.Text;

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
        }

        //Save Button
        private void button1_Click_1(object sender, EventArgs e)
        {
            cn = new SqlConnection(sa);
            SqlCommand command = new SqlCommand();
            command.CommandText = "exec Vinhos.UpdateRegiao @Solo, @Clima, @Nome, @Codigo, @ID";
            command.Parameters.Clear();
            command.Parameters.Add("@Solo", SqlDbType.VarChar);
            command.Parameters["@Solo"].Value = solo;
            command.Parameters.Add("@Clima", SqlDbType.VarChar);
            command.Parameters["@Clima"].Value = clima;
            command.Parameters.Add("@Nome", SqlDbType.VarChar);
            command.Parameters["@Nome"].Value = nome;
            command.Parameters.Add("@Codigo", SqlDbType.VarChar);
            command.Parameters["@Codigo"].Value = codigo;
            command.Parameters.Add("@ID", SqlDbType.Int);
            command.Parameters["@ID"].Value = id;

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
            this.Close();
        }

        //Update variables as text changes
        private void richTextBox10_TextChanged(object sender, EventArgs e)
        {
            solo = richTextBox10.Text;
        }
        private void richTextBox12_TextChanged(object sender, EventArgs e)
        {
            clima = richTextBox12.Text;
        }
        private void richTextBox4_TextChanged(object sender, EventArgs e)
        {
            codigo = richTextBox4.Text;
        }
        private void richTextBox3_TextChanged_1(object sender, EventArgs e)
        {
            nome = richTextBox3.Text;
        }



        //Nerver used
        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
        private void richTextBox10_TextChanged_1(object sender, EventArgs e)
        {

        }
        private void richTextBox12_TextChanged_1(object sender, EventArgs e)
        {

        }
        private void richTextBox4_TextChanged_1(object sender, EventArgs e)
        {


        }
        private void button1_Click(object sender, EventArgs e)
        {

        }
    }
}
