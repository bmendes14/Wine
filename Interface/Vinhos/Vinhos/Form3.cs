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
    public partial class Form3 : Form
    {
        int s;
        private String sa = "data source=tcp:mednat.ieeta.pt\\SQLSERVER,8101;DATABASE=p8g6;UID=p8g6;PASSWORD=123Joao@Bruno";
        SqlConnection cn;
        private String nome;
        private int alccol;
        private double preco;
        private int avaliacao;
        private String descricao;
        private String infoNut;
        private String temperatura;

        private String QuintaNome;
        private String RegiaoNome;
        private int QuintaID;
        private int RegiaoID;

        public Form3(int i)
        {
            s = i;
            InitializeComponent();
            
            
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection(sa);
            SqlCommand command = new SqlCommand();
            command.CommandText= "select * from Vinhos.WineCaracteristics(@ID)";
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
                        richTextBox2.Text = reader.GetString(0);
                        richTextBox2.SelectionAlignment = HorizontalAlignment.Center;
                        richTextBox4.SelectionAlignment = HorizontalAlignment.Center;
                        richTextBox5.SelectionAlignment = HorizontalAlignment.Center;
                        richTextBox1.Text = reader.GetString(4);
                        richTextBox3.Text = reader.GetString(5);
                        richTextBox4.Text = reader.GetInt32(1) + "%";
                        richTextBox5.Text = reader.GetSqlDecimal(2) +"€";
                        richTextBox6.Text = reader.GetString(7);
                        richTextBox7.Text = "Avaliação: " + reader.GetInt32(3)+"/10";
                        QuintaID = reader.GetInt32(9);
                        QuintaNome = reader.GetString(10);
                        button2.Text = "Quinta: " + QuintaNome;
                        RegiaoID = reader.GetInt32(8);
                        RegiaoNome = reader.GetString(11);
                        button3.Text = "Região: "+RegiaoNome;
                    }
                }

            }
            catch(Exception ex)
            {
                throw new Exception("Failed to load");
            }
            finally
            {
                cn.Close();
            }


            command.CommandText = "select * from Vinhos.GetDistQuinta(@ID)";
            command.Parameters.Clear();
            command.Parameters.Add("@ID", SqlDbType.Int);
            command.Parameters["@ID"].Value = QuintaID;
            command.Connection = cn;
            cn.Open();
            try
            {
                command.ExecuteNonQuery();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    int x = 32;
                    while (reader.Read())
                    {
                       addButton(reader.GetInt32(0), reader.GetString(1),x);
                        x = x + 130;
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

        private void addButton(int id, String name, int x)
        {
            Button btn = new Button();
            btn.Size = new Size(120, 44);
            btn.Location = new Point(x, 345);
            btn.Text = name;
            btn.BackColor = Color.White;

            btn.Click += (sender, args) =>
            {
                Form19 form = new Form19(id);
                form.Location = this.Location;
                form.StartPosition = FormStartPosition.Manual;
                form.FormClosing += delegate { this.Show(); };
                form.Show();
                this.Hide();
            };


            panel1.Controls.Add(btn);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form5 form = new Form5(QuintaID);
            form.Location = this.Location;
            form.StartPosition = FormStartPosition.Manual;
            form.FormClosing += delegate { this.Show(); };
            form.Show();
            this.Hide();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Form7 form = new Form7(RegiaoID);
            form.Location = this.Location;
            form.StartPosition = FormStartPosition.Manual;
            form.FormClosing += delegate { this.Show(); };
            form.Show();
            this.Hide();
        }


        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            Form7 form = new Form7(RegiaoID);
            form.Location = this.Location;
            form.StartPosition = FormStartPosition.Manual;
            form.FormClosing += delegate { this.Show(); };
            form.Show();
            this.Hide();

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox7_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form10 form = new Form10(s);
            form.Location = this.Location;
            form.StartPosition = FormStartPosition.Manual;
            form.FormClosing += delegate { this.Close(); };
            form.Show();
            this.Hide();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Form11 form = new Form11(s);
            form.Location = this.Location;
            form.StartPosition = FormStartPosition.Manual;
            form.FormClosing += delegate { this.Close(); };
            form.Show();
            this.Hide();
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
