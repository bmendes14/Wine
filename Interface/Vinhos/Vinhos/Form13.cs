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
    public partial class Form13 : Form
    {

        //Variables
        String nome;
        String codigo;
        String solo;
        String clima;
        //ID is auto increment

        private String sa = "data source=JOAOECT\\SQLEXPRESS;integrated security=true;initial catalog=VinhosDatabase";
        SqlConnection cn;


        public Form13()
        {
            InitializeComponent();
            cn = new SqlConnection(sa);
        }

        //Save on variable as text changes
        private void richTextBox3_TextChanged(object sender, EventArgs e)
        {
            nome = richTextBox3.Text;
        }
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

        //Save Button
        private void button1_Click(object sender, EventArgs e)
        {
            cn = new SqlConnection(sa);
            SqlCommand command = new SqlCommand();
            command.CommandText = "exec Vinhos.InsertRegiao @Solo, @Clima, @Nome, @Codigo";
            command.Parameters.Clear();
            command.Parameters.Add("@Solo", SqlDbType.VarChar);
            command.Parameters["@Solo"].Value = solo;
            command.Parameters.Add("@Clima", SqlDbType.VarChar);
            command.Parameters["@Clima"].Value = clima;
            command.Parameters.Add("@Nome", SqlDbType.VarChar);
            command.Parameters["@Nome"].Value = nome;
            command.Parameters.Add("@Codigo", SqlDbType.VarChar);
            command.Parameters["@Codigo"].Value = codigo;

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


        //Never Used
        private void richTextBox2_TextChanged(object sender, EventArgs e)
        {

        }
        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
