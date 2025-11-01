📝 Not Uygulaması

Bu uygulama, kullanıcıların not oluşturmasına, görüntülemesine ve silmesine olanak sağlayan offline-first yaklaşıma sahip bir not uygulamasıdır. Kullanıcı sisteme giriş yapmadan not işlemleri gerçekleştiremez. Notlar ilk olarak Local Veritabanına (Sqflite) kaydedilir ve ardından internet bağlantısı mevcutsa otomatik olarak API ile senkronize edilir.

🚀 Özellikler

✅ Kullanıcı Kayıt ve Giriş
Firebase Authentication kullanılarak e-posta ve şifre ile kayıt ve giriş işlemleri yapılmaktadır.

🏠 Giriş Sonrası Ana Sayfa (Home Page)
Kullanıcı giriş yaptıktan sonra Home Page'e yönlendirilir.
Bu sayfada:

Oluşturulan notların listesi

Yeni not oluşturma butonu

Dark / Light Tema Değiştirme butonu bulunur.

✏️ Not Oluşturma ve Görüntüleme
Kullanıcı yeni not ekleyebilir ve notlara tıklayarak detay sayfasında görüntüleyebilir.

🗑️ Not Silme
Silme işlemi önce Local DB üzerinden, ardından API üzerinden yapılır.
Böylece internet yokken bile işlem bozulmaz.

🔄 Senkronizasyon
Uygulama açılışında tüm notlar API’den çekilir ve Local veritabanı ile senkronize edilir.

🧱 Mimari

MVC yapısı kullanılmıştır:

Model → Veri katmanı (NoteModel)

View → Ekranlar (UI)

Controller → İş mantığı

📦 Kullanılan Teknolojiler
Teknoloji / Paket	Amaç
Riverpod	State management
Dio	API isteklerini yönetme
Firebase Auth	Kullanıcı kimlik doğrulama
Sqflite	Local veritabanı işlemleri
Auto Route (Varsa)	Sayfalar arası geçiş yönetimi
📸 Uygulama Akışı (Kısa Özet)

Kullanıcı giriş yapar veya kayıt olur.

Home Page açılır → Kayıtlı tüm notlar listelenir.

Yeni not eklenebilir, görüntülenebilir veya silinebilir.

Notlar önce Local DB’ye kaydedilir → Sonra API’ye senkronize edilir.