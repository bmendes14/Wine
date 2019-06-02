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
    public partial class Form10 : Form
    {
        int wine;
        private String sa = "data source=LAPTOP-583710C4\\SQLEXPRESS;integrated security=true;initial catalog=VinhosDatabase";
        SqlConnection cn;

        int quinta;
        String nome;
        int PercentagemAlcool;
        double Preco;
        String descricao;
        String info_nutricional;
        String temperatura;
        int regiao;
        int avaliacao;



        public Form10(int s)
        {
            InitializeComponent();
            cn = new SqlConnection(sa);
            wine = s;
        }

        private void richTextBox2_TextChanged(object sender, EventArgs e)
        {

        }
        bool f = true;
        private void Form10_Load(object sender, EventArgs e)
        {
            SqlCommand command;
            if (f) { 
                f = false;
                String sql = "select * from Vinhos.QuintasName()";
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
                            comboBox1.Items.Add(item);
                        }
                    }
                }
                sql = "select * from Vinhos.RegiaoName()";
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
            cn = new SqlConnection(sa);
            command = new SqlCommand();
            command.CommandText = "select * from Vinhos.WineCaracteristics(@ID)";
            command.Parameters.Clear();
            command.Parameters.Add("@ID", SqlDbType.Int);
            command.Parameters["@ID"].Value = wine;
            command.Connection = cn;
            cn.Open();
            try
            {
                command.ExecuteNonQuery();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                            richTextBox3.Text = reader.GetString(0);
                            richTextBox5.Text = reader.GetString(4);
                            richTextBox6.Text = reader.GetString(5);
                            richTextBox10.Text = reader.GetInt32(1) + "";
                            richTextBox12.Text = reader.GetSqlDecimal(2) + "";
                            richTextBox17.Text = reader.GetString(7);
                            richTextBox4.Text = reader.GetInt32(3) + "";


                            quinta = reader.GetInt32(9);
                            nome = reader.GetString(0);
                            PercentagemAlcool = reader.GetInt32(1);
                            Preco = reader.GetSqlDecimal(2).ToDouble();
                            descricao = reader.GetString(4);
                            info_nutricional= reader.GetString(5);
                            temperatura = reader.GetString(7);
                            regiao = reader.GetInt32(8);
                            avaliacao= reader.GetInt32(3);


                            ComboboxItem[] item = comboBox1.Items.OfType<ComboboxItem>().ToArray();
                            for(int i = 0; i < item.Length; i++)
                            {
                                if ((int)item[i].Value == reader.GetInt32(9))
                                {
                                    comboBox1.SelectedIndex = i;
                                }
                            }

                            ComboboxItem[] item2 = comboBox2.Items.OfType<ComboboxItem>().ToArray();
                            for (int i = 0; i < item2.Length; i++)
                            {
                                if ((int)item2[i].Value == reader.GetInt32(8))
                                {
                                    comboBox2.SelectedIndex = i;
                                }
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
            if (!Int32.TryParse(richTextBox10.Text, out PercentagemAlcool))
            {
                PercentagemAlcool = -1;
            }
        }

        private void richTextBox12_TextChanged(object sender, EventArgs e)
        {
            //Preco = Convert.ToDouble(richTextBox12.Text);  Does not work like this
        }

        private void richTextBox4_TextChanged(object sender, EventArgs e)
        {
            if (!Int32.TryParse(richTextBox4.Text, out avaliacao))
            {
                avaliacao = -1;
            }
        }
        private void richTextBox17_TextChanged(object sender, EventArgs e)
        {
            temperatura = richTextBox17.Text;
        }

        private void richTextBox5_TextChanged(object sender, EventArgs e)
        {
            descricao = richTextBox5.Text;
        }


        private void richTextBox6_TextChanged(object sender, EventArgs e)
        {
            info_nutricional = richTextBox6.Text;
        }

        bool adding = true;
        private void button2_Click(object sender, EventArgs e)
        {
            if (adding) { 
                cn = new SqlConnection(sa);
                SqlCommand command = new SqlCommand();
                command.CommandText = "exec  Vinhos.DeleteVinho @ID";
                command.Parameters.Clear();
                command.Parameters.Add("@ID", SqlDbType.Int);
                command.Parameters["@ID"].Value = wine;
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
                adding = false;
            }
            this.Close();
        }
        bool updating = true;
        private void button1_Click(object sender, EventArgs e)
        {
            if (updating)
            {
                cn = new SqlConnection(sa);
                SqlCommand command = new SqlCommand();
                command.CommandText = "exec Vinhos.UpdateVinho @ID ,@Nome,@PercentagemAlcool,@Preco, @Avaliacao,@Descricao,@InfoNutricional ,@TemperaturaServir ,@RegiaoID, @QuintaID";
                command.Parameters.Clear();
                command.Parameters.Add("@ID", SqlDbType.Int);
                command.Parameters["@ID"].Value = wine;
                command.Parameters.Add("@Nome", SqlDbType.VarChar);
                command.Parameters["@Nome"].Value = nome;
                command.Parameters.Add("@PercentagemAlcool", SqlDbType.Int);
                command.Parameters["@PercentagemAlcool"].Value = PercentagemAlcool;
                command.Parameters.Add("@Preco", SqlDbType.Decimal);
                command.Parameters["@Preco"].Value = PercentagemAlcool;
                command.Parameters.Add("@Avaliacao", SqlDbType.Int);
                command.Parameters["@Avaliacao"].Value = avaliacao;
                command.Parameters.Add("@Descricao", SqlDbType.VarChar);
                command.Parameters["@Descricao"].Value = descricao;
                command.Parameters.Add("@InfoNutricional", SqlDbType.VarChar);
                command.Parameters["@InfoNutricional"].Value = info_nutricional;
                command.Parameters.Add("@TemperaturaServir", SqlDbType.VarChar);
                command.Parameters["@TemperaturaServir"].Value = temperatura;
                command.Parameters.Add("@RegiaoID", SqlDbType.Int);
                command.Parameters["@RegiaoID"].Value = regiao;
                command.Parameters.Add("@QuintaID", SqlDbType.Int);
                command.Parameters["@QuintaID"].Value = quinta ;

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
                updating = false;
            }
            this.Close();
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            ComboboxItem intem = (ComboboxItem)comboBox1.SelectedItem;
            quinta = (int)intem.Value;
        }

        private void comboBox2_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            ComboboxItem intem = (ComboboxItem)comboBox2.SelectedItem;
            regiao = (int)intem.Value;
        }

        

        private void richTextBox11_TextChanged(object sender, EventArgs e)
        {

        }
    }
}

