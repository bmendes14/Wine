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
    public partial class Form5 : Form
    {
        int s;
        int owner;
        int regiao;
        private String sa = "data source=JOAOECT\\SQLEXPRESS;integrated security=true;initial catalog=VinhosDatabase";
        SqlConnection cn;
        private String nome;
        private String Morada;
        private int TamanhoProducao;
        private String descricao;
        private String telefone;
        private int ID;
        private int RegiaoID;
        public Form5(int i)
        {
            InitializeComponent();
            s = i;
        }

        private void Form5_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection(sa);
            SqlCommand command = new SqlCommand();
            command.CommandText = "select * from Vinhos.QuintaInfo(@ID);";
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
                        Console.WriteLine(reader.GetString(0));
                        richTextBox2.Text = reader.GetString(0);
                        richTextBox2.SelectionAlignment = HorizontalAlignment.Center;
                        richTextBox1.SelectionAlignment = HorizontalAlignment.Center;
                        richTextBox1.Text = reader.GetString(4);
                        richTextBox6.Text = reader.GetString(3);
                        richTextBox7.Text = reader.GetInt32(2) + "l/ano";
                        richTextBox3.Text = reader.GetString(1);
                        button2.Text = "Regiao: " + reader.GetString(7);
                        regiao = reader.GetInt32(6);
                        button3.Text = "Owner: " + reader.GetString(8);
                        owner = reader.GetInt32(9);

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

        

        private void richTextBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox7_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form7 form = new Form7(regiao);
            form.Location = this.Location;
            form.StartPosition = FormStartPosition.Manual;
            form.FormClosing += delegate { this.Show(); };
            form.Show();
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form8 form = new Form8(owner);
            form.Location = this.Location;
            form.StartPosition = FormStartPosition.Manual;
            form.FormClosing += delegate { this.Show(); };
            form.Show();
            this.Hide();
        }
    }
}
