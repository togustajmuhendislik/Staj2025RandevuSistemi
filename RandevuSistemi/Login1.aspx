<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="RandevuSistemi.Login" %>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Giriş Sayfası</title>

    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
    <link href="../Template/global_assets/css/icons/icomoon/styles.min.css" rel="stylesheet" type="text/css">
    <link href="../Template/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="../Template/assets/css/bootstrap_limitless.min.css" rel="stylesheet" type="text/css">
    <link href="../Template/assets/css/layout.min.css" rel="stylesheet" type="text/css">
    <link href="../Template/assets/css/components.min.css" rel="stylesheet" type="text/css">
    <link href="../Template/assets/css/colors.min.css" rel="stylesheet" type="text/css">

    <script src="../Template/global_assets/js/main/jquery.min.js"></script>
    <script src="../Template/global_assets/js/main/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/locale/tr.js"></script>

    <script src="../Template/global_assets/js/plugins/loaders/blockui.min.js"></script>
    <script src="../Template/global_assets/js/plugins/notifications/jgrowl.min.js"></script>
    <script src="../Template/global_assets/js/plugins/notifications/noty.min.js"></script>
    <script src="../Template/global_assets/js/plugins/loaders/progressbar.min.js"></script>
    <script src="../Template/assets/js/app.js"></script>
    
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif; /* Kullanıcının tercih ettiği font */
            background: linear-gradient(to bottom right, #f0f4f8, #e0e7ee); /* Hafif, modern bir gradyan */
        }
        
        /* Kullanıcının sağladığı genel stil kuralları */
        .page-content {
            display: flex;
            min-height: calc(100vh - 56px); /* Navbar yüksekliği çıkarıldı */
            flex-grow: 1;
        }
        .navbar-custom {
            background: linear-gradient(to right, white, #19115F);
        }
        .navbar-custom .navbar-brand img {
            max-width: 100%;
            height: auto;
            max-height: 50px;
        }
        .sidebar-custom {
            background-color: #524c87;
        }
        #main-sidebar {
            flex-shrink: 0;
        }
        .content-wrapper {
            flex-grow: 1;
            overflow-y: auto;
            padding: 20px;
        }
        .sidebar-header {
            padding: 1rem 1.25rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .sidebar-header .btn {
            color: #fff;
        }

        /* Login ve Info panel stilleri - önceki sürümden adapte edildi */
        .main-layout-container {
            display: flex;
            flex-direction: column; /* Küçük ekranlarda dikey yığılma */
            min-height: 100vh;
            justify-content: center;
            align-items: center; /* Dikeyde ve küçük ekranlarda yatayda ortalama */
            padding: 1rem;
        }

        @media (min-width: 768px) {
            .main-layout-container {
                flex-direction: row; /* Büyük ekranlarda yatay düzen */
                align-items: stretch; /* İçerikleri dikeyde esnet */
                justify-content: center; /* Yatayda ortalama */
                padding: 0; /* Tam ekran kullanmak için padding'i kaldır */
            }
        }

        .info-panel, .login-panel { /* Panellerin tek bütün gibi görünmesi için ortak stil */
            background-color: white; 
            padding: 2.5rem;
            border-radius: 1rem;
            border: 1px solid #e2e8f0;
            margin-bottom: 1.5rem; /* Küçük ekranlarda alt boşluk */
        }

        .info-panel { /* Soldaki bilgilendirme paneli */
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05); /* Daha hafif gölge */
            max-width: 450px;
            width: 100%;
            text-align: left;
        }
        @media (min-width: 768px) {
            .info-panel {
                width: 55%; 
                margin-right: 2rem; 
                margin-bottom: 0; 
                height: auto; 
                display: flex; 
                flex-direction: column;
                justify-content: center;
                padding: 3rem; 
            }
        }

        .login-panel { /* Sağdaki giriş formu paneli */
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1); /* Daha belirgin gölge */
            max-width: 450px;
            width: 100%;
            text-align: center;
        }
        @media (min-width: 768px) {
            .login-panel {
                width: 45%; 
                height: auto; 
                display: flex; 
                flex-direction: column;
                justify-content: center;
                align-items: center;
                padding: 3rem; 
            }
        }

        /* Form elemanları ve buton stilleri */
        .form-input {
            width: 100%;
            padding: 0.75rem 1rem;
            margin-bottom: 1rem;
            border: 1px solid #cbd5e0;
            border-radius: 0.5rem;
            font-size: 1rem;
            transition: border-color 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
            outline: none;
        }
        .form-input:focus {
            border-color: #524c87;
            box-shadow: 0 0 0 3px rgba(82, 76, 135, 0.2);
        }
        .btn-primary {
            background: linear-gradient(to right, #524c87, #19115F);
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            transition: opacity 0.2s ease-in-out, transform 0.2s ease-in-out;
            border: none;
            width: 100%;
            font-size: 1.1rem;
        }
        .btn-primary:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }
        .link {
            color: #524c87;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s ease-in-out;
        }
        .link:hover {
            color: #19115F;
            text-decoration: underline;
        }
        .logo {
            margin-bottom: 1.5rem;
            max-width: 180px;
            height: auto;
        }

        /* JavaScript için mesaj kutusu stilleri */
        .app-message-box {
            position: fixed;
            bottom: 1rem;
            right: 1rem;
            padding: 1rem;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            color: white;
            z-index: 9999;
            transition: transform 0.3s ease-out;
            transform: translateX(100%); /* Başlangıçta ekran dışında */
        }
        .app-message-box.bg-green-500 { background-color: #28a745; }
        .app-message-box.bg-red-500 { background-color: #dc3545; }
        .app-message-box.bg-blue-500 { background-color: #007bff; }
        .app-message-box.translate-x-0 { transform: translateX(0); }

        /* Kayıt Modal'ı Stilleri */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6); /* Yarı şeffaf siyah arka plan */
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000; /* Diğer her şeyin üzerinde */
            opacity: 0; /* Başlangıçta gizli */
            visibility: hidden; /* Başlangıçta görünmez */
            transition: opacity 0.3s ease-in-out, visibility 0.3s ease-in-out;
        }
        .modal-overlay.active {
            opacity: 1;
            visibility: visible;
        }
        .modal-content {
            background-color: white;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 90%; /* Duyarlılık için */
            transform: translateY(-20px); /* Hafif yukarıdan açılma efekti */
            transition: transform 0.3s ease-in-out;
        }
        .modal-overlay.active .modal-content {
            transform: translateY(0);
        }
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }
        .modal-header h3 {
            font-size: 1.75rem;
            font-weight: 600;
            color: #333;
        }
        .modal-close-button {
            background: none;
            border: none;
            font-size: 1.5rem;
            color: #999;
            cursor: pointer;
            transition: color 0.2s;
        }
        .modal-close-button:hover {
            color: #555;
        }
        .modal-buttons {
            display: flex;
            justify-content: flex-end; /* Butonları sağa hizala */
            gap: 1rem; /* Butonlar arasında boşluk */
            margin-top: 1.5rem;
        }
        .btn-secondary {
            background-color: #f0f0f0;
            color: #333;
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            border: 1px solid #ccc;
            transition: background-color 0.2s, color 0.2s;
        }
        .btn-secondary:hover {
            background-color: #e0e0e0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-layout-container">
            <div class="info-panel">
                <h2 class="text-2xl font-bold text-gray-800 mb-6">Uygulama Hakkında Genel Bilgiler</h2>
                <div class="text-gray-700 leading-relaxed text-base">
                    <p class="mb-4">Randevu almak için lütfen kayıt olunuz. Kayıt olmadan önce lütfen aşağıdaki açıklmaları dikkatlice okuyunuz. 
                        •	Başvurunuz sırasında vereceğiniz bilgiler gizli tutulmaktadır. Bilgileriniz TOGÜ PDRMER uzmanları dışında hiç kimseyle paylaşılmamaktadır.
                        •	Acil durumlarda randevu alamadıysanız mesai saatleri içinde (hafta içi 08:00-12:00; 13:00-17:00) TOGÜ PDRMER’e doğrudan gelmeniz ya da telefonla aramanız, mesai saatleri dışında ise en yakın sağlık kuruluşuna ulaşmanız önerilmektedir.
                        •	Standart olarak haftada bir oturum görüşme yapılmakla birlikte, görüşmelerin süresi ve sıklığı ihtiyaçlarınıza göre şekillenmekte olup süreç en fazla altı oturum sürmektedir.
                        •	İlk randevunuza haber vermeden gelmediğiniz takdirde TOGÜ PDRMER’den yardım almaktan vazgeçtiğiniz düşünülür ve randevunuz iptal edilir.  Randevunuza gelemeyeceğiniz durumlarda PDRMER’e 24 saat öncesinden haber vermeniz gerekmektedir.
                        •	Süreç ile ilgili sorularınız varsa pdrmer.gop.edu.tr adresindeki iletişim sekmesinde yer alan adreslerden ve telefon numaralarından bizlere ulaşabilirsiniz.
                        •	Randevunuza vaktinden 15 dk önce geliniz. İlk değerlendirme öncesinde doldurmanız gereken bazı formlar olabilir.
                        •	Uzmanımız, sizi vaktinde görüşmeye almaya çalışacaktır, önceki randevularda beklenmeyen uzamalar nedeniyle gecikmeler olabilecektir. Sizden kaynaklı bir gecikme durumunda randevu süreniz uzatılamayacaktır.
                        •	Her seans 45 dakika olarak gerçekleştirilir. Zamanında seansa yetişemeyen danışan, kalan süresince seansa katılır.
                    </p>
                </div>
            </div>

            <div class="login-panel">
                <div class="flex justify-center items-center mb-6">
                   <img src="../Template/global_assets/images/pdrmer_tr_.png"  alt="Site Logosu">
                </div>

                <h2 class="text-2xl font-bold text-gray-800 mb-6">Giriş Yapın</h2>

                <%-- Login Form --%>
                <div class="mb-4 text-left">
                    <label for="txtEmail" class="block text-gray-700 text-sm font-medium mb-2">E-posta Adresi</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="e-posta adresinizi girin" TextMode="Email" Required="true"></asp:TextBox>
                </div>
                <div class="mb-4 text-left">
                    <label for="txtPassword" class="block text-gray-700 text-sm font-medium mb-2">Parola</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" placeholder="parolanızı girin" TextMode="Password" Required="true"></asp:TextBox>
                </div>
                
                <div class="flex justify-center items-center mb-6"> 
                    <a href="#" class="link text-sm" style="margin-right: 1.5rem;">Parolanızı mı Unuttunuz?</a> 
                    <a href="#" onclick="openRegisterModal(event)" class="link text-sm">Kayıt Ol</a>
                </div>

                <asp:Button ID="btnLogin" runat="server" Text="Giriş" CssClass="btn-primary" OnClick="btnLogin_Click" />
            </div>
        </div>

        <%-- Register Modal --%>
        <div id="registerModal" class="modal-overlay">
            <div class="modal-content">
                <div class="modal-header">
                    <h3>Yeni Hesap Oluştur</h3>
                    <button class="modal-close-button" onclick="closeRegisterModal()">&times;</button>
                </div>
                <%-- Register Form --%>
                <div class="mb-4 text-left">
                    <label for="txtRegisterFullName" class="block text-gray-700 text-sm font-medium mb-2">Ad Soyad</label>
                    <asp:TextBox ID="txtRegisterFullName" runat="server" CssClass="form-input" placeholder="Adınızı ve soyadınızı girin" Required="true"></asp:TextBox>
                </div>
                <div class="mb-4 text-left">
                    <label for="txtRegisterEmail" class="block text-gray-700 text-sm font-medium mb-2">E-posta Adresi</label>
                    <asp:TextBox ID="txtRegisterEmail" runat="server" CssClass="form-input" placeholder="e-posta adresinizi girin" TextMode="Email" Required="true"></asp:TextBox>
                </div>
                <div class="mb-4 text-left">
                    <label for="txtRegisterPhone" class="block text-gray-700 text-sm font-medium mb-2">Telefon Numarası</label>
                    <asp:TextBox ID="txtRegisterPhone" runat="server" CssClass="form-input" placeholder="Telefon numaranızı girin (örn: 5XX XXX XX XX)" TextMode="SingleLine" Required="true"></asp:TextBox>
                </div>
                <div class="mb-4 text-left">
                    <label for="txtRegisterPassword" class="block text-gray-700 text-sm font-medium mb-2">Parola</label>
                    <asp:TextBox ID="txtRegisterPassword" runat="server" CssClass="form-input" placeholder="parolanızı girin" TextMode="Password" Required="true"></asp:TextBox>
                </div>
                <div class="mb-4 text-left">
                    <label for="txtRegisterPasswordConfirm" class="block text-gray-700 text-sm font-medium mb-2">Parola Tekrar</label>
                    <asp:TextBox ID="txtRegisterPasswordConfirm" runat="server" CssClass="form-input" placeholder="parolanızı tekrar girin" TextMode="Password" Required="true"></asp:TextBox>
                </div>

                <div class="modal-buttons">
                    <button type="button" onclick="closeRegisterModal()" class="btn-secondary">İptal</button>
                    <asp:Button ID="btnRegister" runat="server" Text="Kayıt Ol" CssClass="btn-primary" OnClick="btnRegister_Click" />
                </div>
            </div>
        </div>
    </form>

    <script>
        // JavaScript showMessage fonksiyonu ASP.NET postback'i sonrası tekrar çalışmayacağı için
        // bunun yerine ASP.NET'in kendi mekanizması olan ScriptManager.RegisterStartupScript
        // kullanılmalıdır. Ancak client tarafı bildirim için bu fonksiyonu yine de bırakabiliriz.
        // Veya daha iyisi, ASP.NET Ajax Control Toolkit'teki ModalPopupExtender gibi kontrolleri kullanmak.
        // Bu örnekte client-side showMessage fonksiyonunu koruduk, ancak server'dan tetiklenmesi için C# tarafında ScriptManager kullanmak gerekecek.

        /**
         * Kullanıcıya mesaj göstermek için özel bir modal/mesaj kutusu.
         * alert() yerine kullanılmalıdır.
         * @param {string} message - Gösterilecek mesaj.
         * @param {'success' | 'error' | 'info'} type - Mesajın türü (renklendirme için).
         */
        function showMessage(message, type) {
            const existingMessage = document.getElementById('app-message-box');
            if (existingMessage) {
                existingMessage.remove();
            }

            const messageBox = document.createElement('div');
            messageBox.id = 'app-message-box';
            messageBox.className = `app-message-box`; // Custom class

            let bgColorClass = '';
            switch (type) {
                case 'success':
                    bgColorClass = 'bg-green-500';
                    break;
                case 'error':
                    bgColorClass = 'bg-red-500';
                    break;
                case 'info':
                default:
                    bgColorClass = 'bg-blue-500';
                    break;
            }

            messageBox.classList.add(bgColorClass);
            messageBox.innerHTML = `
                <div class="flex items-center justify-between">
                    <span>${message}</span>
                    <button class="ml-4 text-white hover:text-gray-100" onclick="this.parentNode.parentNode.remove()">
                        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                        </svg>
                    </button>
                </div>
            `;
            document.body.appendChild(messageBox);

            // Mesaj kutusunu görünür yap
            setTimeout(() => {
                messageBox.classList.add('translate-x-0');
            }, 10);

            // Birkaç saniye sonra mesaj kutusunu otomatik olarak kapat
            setTimeout(() => {
                messageBox.classList.remove('translate-x-0');
                messageBox.addEventListener('transitionend', () => messageBox.remove());
            }, 3000);
        }

        /**
         * Kayıt modal penceresini açar.
         * @param {Event} event - Olay nesnesi (linkin varsayılan davranışını engellemek için).
         */
        function openRegisterModal(event) {
            event.preventDefault(); // Linkin sayfayı yenilemesini engelle
            document.getElementById('registerModal').classList.add('active');
        }

        /**
         * Kayıt modal penceresini kapatır.
         */
        function closeRegisterModal() {
            document.getElementById('registerModal').classList.remove('active');
            // Formu temizle
            document.getElementById('<%= txtRegisterFullName.ClientID %>').value = '';
            document.getElementById('<%= txtRegisterEmail.ClientID %>').value = '';
            document.getElementById('<%= txtRegisterPhone.ClientID %>').value = ''; 
            document.getElementById('<%= txtRegisterPassword.ClientID %>').value = '';
            document.getElementById('<%= txtRegisterPasswordConfirm.ClientID %>').value = '';
        }

        // ASP.NET postback'i sonrası modalın açık kalması için eğer registration başarılıysa
        // veya hata varsa modalı yeniden açmak gerekebilir. Bu kısım C# CodeBehind'da yönetilmeli.
        // Eğer client-side bir doğrulama varsa, handleRegister fonksiyonunu bu JS'de tutmak yerine
        // ASP.NET Validation kontrollerini kullanmak daha uygun olacaktır.

        // Aşağıdaki iki JS fonksiyonu (handleLogin, handleRegister) artık ASP.NET server-side
        // kontrolleri tarafından işleneceği için doğrudan HTML formunda çağrılmayacaktır.
        // Ancak modal açma/kapama gibi tamamen client-side etkileşimler için hala kullanılabilirler.
    </script>
</body>
</html>