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
    public partial class Form9 : Form
    {
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


        public Form9()
        {
            InitializeComponent();
            cn = new SqlConnection(sa);
        }

        private void richTextBox9_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox11_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox5_TextChanged(object sender, EventArgs e)
        {
            descricao = richTextBox5.Text;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ComboboxItem intem = (ComboboxItem) comboBox1.SelectedItem;
            quinta = (int) intem.Value;
        }

        private void richTextBox19_TextChanged(object sender, EventArgs e)
        {

        }
        bool f = true;
        private void panel1_Paint(object sender, PaintEventArgs e)
        {
            if (f) {
                f = false;
                String sql = "select * from Vinhos.QuintasName()";
                cn.Close();
                cn.Open();
                using (SqlCommand command = new SqlCommand(sql, cn))
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
                    using (SqlCommand command = new SqlCommand(sql, cn))
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
        }

        private void richTextBox3_TextChanged(object sender, EventArgs e)
        {
            nome = richTextBox3.Text;
            richTextBox6.Text = nome;
        }

        private void richTextBox6_TextChanged(object sender, EventArgs e)
        {
            info_nutricional = richTextBox6.Text;
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
            Preco = Convert.ToDouble(richTextBox12.Text);
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

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            ComboboxItem intem = (ComboboxItem)comboBox2.SelectedItem;
            regiao = (int)intem.Value;
        }

        private void richTextBox21_TextChanged(object sender, EventArgs e)
        {

        }
        bool adding = true;

        private void button1_Click(object sender, EventArgs e)
        {
            if (adding)
            {
                cn = new SqlConnection(sa);
                SqlCommand command = new SqlCommand();
                command.CommandText = "exec Vinhos.InsertVinho @Nome ,@PercentagemAlcool ,@Preco, @Avaliacao ,@Descricao ,@InfoNutricional ,@TemperaturaServir, @RegiaoID, @QuintaID";
                command.Parameters.Clear();
                command.Parameters.Add("@Nome", SqlDbType.VarChar);
                command.Parameters["@Nome"].Value = nome;
                command.Parameters.Add("@PercentagemAlcool", SqlDbType.Int);
                command.Parameters["@PercentagemAlcool"].Value = PercentagemAlcool;
                command.Parameters.Add("@Preco", SqlDbType.Decimal);
                command.Parameters["@Preco"].Value = Preco;
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
                command.Parameters["@QuintaID"].Value = quinta;

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

        private void richTextBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}

public class ComboboxItem
{
    public string Text { get; set; }
    public object Value { get; set; }

    public override string ToString()
    {
        return Text;
    }
}
