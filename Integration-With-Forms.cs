using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Lab11
{
    public partial class username : Form
    {
        public username()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            string connectionString = "Data Source=DESKTOP-P2HKKGN\\SQLEXPRESS;Initial Catalog=Lab10;Integrated Security=True";

            SqlConnection con = new SqlConnection(connectionString);


            con.Open();

            string FirstName = fname.Text;
            string LastName = lname.Text;
            string Emailg = Email.Text;
            string Passwordg = Password.Text;


            string Query = "INSERT INTO facebook (FNAME, LName, Email, Pasword) VALUES ('"+FirstName+"', '"+LastName+"', '"+Emailg+"', '"+Passwordg+"')";

            SqlCommand cmd = new SqlCommand(Query, con);

            cmd.ExecuteNonQuery();

            con.Close();

            MessageBox.Show("Success Operation");


        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
         
            Form2 f2 = new Form2();   
            f2.Show();
            this.Hide();

         
        }

    }
}
