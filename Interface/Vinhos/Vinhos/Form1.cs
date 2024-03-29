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
 

    public partial class Form1 : Form
    {
        private String sa = "data source=tcp:mednat.ieeta.pt\\SQLSERVER,8101;DATABASE=p8g6;UID=p8g6;PASSWORD=123Joao@Bruno";
        SqlConnection cn;
        int i,x,q = 0;
        bool done = false;

        public Form1()
        {
            InitializeComponent();
        }


        private void panel4_Paint(object sender, PaintEventArgs e)
        {
            if (!done) {
                done = true;
                cn = new SqlConnection(sa);
                SqlCommand command = new SqlCommand();
                command.CommandText = "select * from Vinhos.CountWines()";
                command.Connection = cn;
                cn.Open();
                try
                {
                    command.ExecuteNonQuery();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        { 
                            Random r = new Random();
                            i = r.Next(0,reader.GetInt32(0)-1);
                            x = i;
                            while (i == x)
                            {
                                x = r.Next(0, reader.GetInt32(0)-1);
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("Failed to load");
                }

                command.CommandText = "select * from Vinhos.getRandom(@ID)";
                command.Parameters.Clear();
                command.Parameters.Add("@ID", SqlDbType.Int);
                command.Parameters["@ID"].Value = i;
                command.Connection = cn;
                try
                {
                    command.ExecuteNonQuery();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            richTextBox2.Text = reader.GetString(0);
                            richTextBox2.SelectionAlignment = HorizontalAlignment.Center;
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("Failed to load");
                }

                command.Parameters.Clear();
                command.Parameters.Add("@ID", SqlDbType.Int);
                command.Parameters["@ID"].Value = x;
                command.Connection = cn;
                try
                {
                    command.ExecuteNonQuery();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            richTextBox1.Text = reader.GetString(0);
                            richTextBox1.SelectionAlignment = HorizontalAlignment.Center;
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



                cn = new SqlConnection(sa);
                command = new SqlCommand();
                command.CommandText = "select * from Vinhos.CountQuintas()";
                command.Connection = cn;
                cn.Open();
                try
                {
                    command.ExecuteNonQuery();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Random r = new Random();
                            q = r.Next(0, reader.GetInt32(0)-1);
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("Failed to load");
                }


                command.CommandText = "select * from Vinhos.getRandomQuinta(@ID) ";
                command.Parameters.Clear();
                command.Parameters.Add("@ID", SqlDbType.Int);
                command.Parameters["@ID"].Value = q;
                command.Connection = cn;
                try
                {
                    command.ExecuteNonQuery();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            richTextBox3.Text = reader.GetString(0);
                            richTextBox3.SelectionAlignment = HorizontalAlignment.Center;
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


                buttonsChange(i, x,q);
             }
        }

        private void buttonsChange (int x, int y, int z)
        {
            button2.Click += (sender, args) =>
            {
                Form3 form = new Form3(x);
                form.Location = this.Location;
                form.StartPosition = FormStartPosition.Manual;
                form.FormClosing += delegate { this.Show(); };
                form.Show();
                this.Hide();
            };
            button4.Click += (sender, args) =>
            {
                Form3 form = new Form3(y);
                form.Location = this.Location;
                form.StartPosition = FormStartPosition.Manual;
                form.FormClosing += delegate { this.Show(); };
                form.Show();
                this.Hide();
            };

            button5.Click += (sender, args) =>
            {
                Form5 form = new Form5(z);
                form.Location = this.Location;
                form.StartPosition = FormStartPosition.Manual;
                form.FormClosing += delegate { this.Show(); };
                form.Show();
                this.Hide();
            };
        }

        private void textBox8_TextChanged(object sender, EventArgs e)
        {

        }

        private void button3_Click_1(object sender, EventArgs e)
        {
            Form2 form = new Form2();
            form.Location = this.Location;
            form.StartPosition = FormStartPosition.Manual;
            form.FormClosing += delegate { this.Show(); };
            form.Show();
            this.Hide();
            
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void toolTip1_Popup(object sender, PopupEventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void richTextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {
            Form4 form = new Form4();
            form.Location = this.Location;
            form.StartPosition = FormStartPosition.Manual;
            form.FormClosing += delegate { this.Show(); };
            form.Show();
            this.Hide();
        }

        private void button9_Click(object sender, EventArgs e)
        {
            Form6 form = new Form6();
            form.Location = this.Location;
            form.StartPosition = FormStartPosition.Manual;
            form.FormClosing += delegate { this.Show(); };
            form.Show();
            this.Hide();
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void richTextBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {

        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void button7_Click(object sender, EventArgs e)
        {
            Form15 form = new Form15();
            form.Location = this.Location;
            form.StartPosition = FormStartPosition.Manual;
            form.FormClosing += delegate { this.Show(); };
            form.Show();
            this.Hide();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            Form17 form = new Form17();
            form.Location = this.Location;
            form.StartPosition = FormStartPosition.Manual;
            form.FormClosing += delegate { this.Show(); };
            form.Show();
            this.Hide();
        }

        private void button4_Click(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
