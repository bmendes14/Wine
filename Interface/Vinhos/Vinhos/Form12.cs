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
    public partial class Form12 : Form
    {
        int id;
        String nome;
        String aroma;
        String descricao;
        int castaId;

        private String sa = "data source=JOAOECT\\SQLEXPRESS;integrated security=true;initial catalog=VinhosDatabase";
        SqlConnection cn;

        public Form12(int ss)
        {
            InitializeComponent();
            id = ss;
            cn = new SqlConnection(sa);
        }

        private void richTextBox20_TextChanged(object sender, EventArgs e)
        {

        }

        bool f = true;
        private void Form12_Load(object sender, EventArgs e)
        {
            SqlCommand command;
            if (f)
            {

                cn = new SqlConnection(sa);
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
                            richTextBox6.Text = reader.GetString(0);
                        }
                    }

                }
                catch (Exception ex)
                {
                    throw new Exception("Failed to load");
                }
                try { 
                    f = false;
                    String sql = "select * from  Vinhos.ALLCastas();";
                    cn.Close();
                    cn.Open();
                    using (command = new SqlCommand(sql, cn))
                    {

                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                ComboboxItem item = new ComboboxItem();
                                item.Text = reader.GetString(0);
                                item.Value = reader.GetInt32(1);
                                comboBox2.Items.Add(item);
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
            }
        }

        private void richTextBox3_TextChanged(object sender, EventArgs e)
        {
            nome = richTextBox3.Text;
        }

        private void richTextBox10_TextChanged(object sender, EventArgs e)
        {
            aroma = richTextBox10.Text;
        }

        private void richTextBox4_TextChanged(object sender, EventArgs e)
        {
            descricao = richTextBox4.Text;
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            ComboboxItem intem = (ComboboxItem)comboBox2.SelectedItem;
            castaId = (int)intem.Value;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "exec Vinhos.InsertTem @VinhoID, @CastaID";
            command.Parameters.Clear();
            command.Parameters.Add("@VinhoID", SqlDbType.Int);
            command.Parameters["@VinhoID"].Value = id;
            command.Parameters.Add("@CastaID", SqlDbType.Int);
            command.Parameters["@CastaID"].Value = castaId;
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

        private void button1_Click(object sender, EventArgs e)
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = "exec Vinhos.CastaRelationTem @VinhoID, @Aroma, @Descricao, @Nome";
            command.Parameters.Clear();
            command.Parameters.Add("@VinhoID", SqlDbType.Int);
            command.Parameters["@VinhoID"].Value = id;
            command.Parameters.Add("@Aroma", SqlDbType.VarChar);
            command.Parameters["@Aroma"].Value = aroma;
            command.Parameters.Add("@Descricao", SqlDbType.VarChar);
            command.Parameters["@Descricao"].Value = descricao;
            command.Parameters.Add("@Nome", SqlDbType.VarChar);
            command.Parameters["@Nome"].Value = nome;
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

        private void richTextBox6_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
