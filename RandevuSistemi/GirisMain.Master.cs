using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration; // Bağlantı dizini için

namespace RandevuSistemi
{
    public partial class GirisMain : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBilgilendirmeNotlari();
            }
        }

        private void BindBilgilendirmeNotlari()
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            string query = "SELECT Baslik, Icerik FROM BilgilendirmeNotlari WHERE Aktif = 1 ORDER BY Sirasi ASC";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    try
                    {
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        rptBilgilendirmeNotlari.DataSource = dr;
                        rptBilgilendirmeNotlari.DataBind();
                    }
                    catch (Exception ex)
                    {
                        // Hata yönetimi: Loglama yapabilir veya kullanıcıya dostu bir mesaj gösterebilirsiniz.
                        System.Diagnostics.Debug.WriteLine("Veri tabanı hatası: " + ex.Message);
                    }
                }
            }
        }

        protected void btnForgotPassword_Click(object sender, EventArgs e)
        {
            // Parola unuttum işlemleri burada yapılacak
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Giriş işlemleri burada yapılacak
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Kayıt ol işlemleri burada yapılacak
        }
    }
}