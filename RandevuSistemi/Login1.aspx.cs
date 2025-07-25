using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RandevuSistemi
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Giriş formu gönderme işlemi
            string email = txtEmail.Text;
            string password = txtPassword.Text;

            // Burada veritabanı sorgusu, kullanıcı doğrulama vb. işlemler yapılacak.
            // Örnek olarak sadece konsola bilgi yazdırıyoruz.
            System.Diagnostics.Debug.WriteLine("Giriş bilgileri:");
            System.Diagnostics.Debug.WriteLine("E-posta: " + email);
            System.Diagnostics.Debug.WriteLine("Parola: " + password);

            // Başarılı veya hatalı giriş durumuna göre kullanıcıya mesaj göster
            // JavaScript showMessage fonksiyonunu server-side'dan tetikleme
            if (email == "test@example.com" && password == "password") // Örnek başarılı giriş
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "LoginSuccess", "showMessage('Giriş başarılı! Ana sayfaya yönlendiriliyorsunuz...', 'success');", true);
                // Başarılı giriş sonrası başka bir sayfaya yönlendirme
                Response.Redirect("Default.aspx"); // Yönlendirilecek sayfa adı
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "LoginError", "showMessage('Geçersiz e-posta veya parola.', 'error');", true);
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Kayıt formu gönderme işlemi
            string fullName = txtRegisterFullName.Text;
            string email = txtRegisterEmail.Text;
            string phoneNumber = txtRegisterPhone.Text;
            string password = txtRegisterPassword.Text;
            string passwordConfirm = txtRegisterPasswordConfirm.Text;

            // Parola eşleşme kontrolü
            if (password != passwordConfirm)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "RegisterPasswordMismatch", "showMessage('Parolalar eşleşmiyor!', 'error');", true);
                // Modalın açık kalması için
                ScriptManager.RegisterStartupScript(this, GetType(), "OpenModal", "openRegisterModal(event);", true);
                return;
            }

            // Burada veritabanına kayıt işlemi, email doğrulama vb. işlemler yapılacak.
            // Örnek olarak sadece konsola bilgi yazdırıyoruz.
            System.Diagnostics.Debug.WriteLine("Kayıt bilgileri:");
            System.Diagnostics.Debug.WriteLine("Ad Soyad: " + fullName);
            System.Diagnostics.Debug.WriteLine("E-posta: " + email);
            System.Diagnostics.Debug.WriteLine("Telefon Numarası: " + phoneNumber);
            System.Diagnostics.Debug.WriteLine("Parola: " + password); // Gerçek uygulamada parola hash'lenmelidir!

            // Başarılı kayıt durumunda
            ScriptManager.RegisterStartupScript(this, GetType(), "RegisterSuccess", "showMessage('Kayıt başarılı! Yönlendiriliyorsunuz...', 'success');", true);

            // Başarılı kayıt sonrası Dogrulama.aspx sayfasına yönlendirme
            ScriptManager.RegisterStartupScript(this, GetType(), "RedirectToDogrulama", "setTimeout(function(){ window.location.href = 'Dogrulama.aspx'; }, 1500);", true);
        }

    }
}