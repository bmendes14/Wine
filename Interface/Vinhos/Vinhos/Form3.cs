﻿using System;
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
        private String sa = "data source=JOAOECT\\SQLEXPRESS;integrated security=true;initial catalog=VinhosDatabase";
        SqlConnection cn;
        private String nome;
        private int alccol;
        private double preco;
        private int avaliacao;
        private String descricao;
        private String infoNut;
        private String temperatura;


        public Form3(int i)
        {
            s = i;
            InitializeComponent();
            
            
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            cn = new SqlConnection(sa);
            SqlCommand command = new SqlCommand();
            command.CommandText="exec Vinhos.WineCaracteristics @ID";
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
                         
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

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
    }
}
