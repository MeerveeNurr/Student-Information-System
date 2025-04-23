import 'package:flutter/material.dart';
import 'BasePage.dart';

class PersonalInformationPage extends StatelessWidget {
  final String email;   // E-posta bilgisi
  final String password; // Şifre bilgisi

  // Constructor, email ve password değerlerini alır
  PersonalInformationPage({required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return BasePage(  // BasePage, ana yapı olarak kullanılır
      email: email,  // BasePage'e e-posta bilgisi gönderilir
      password: password,  // BasePage'e şifre bilgisi gönderilir
      bodyContent: _buildBody(),  // Sayfanın içerik kısmı
    );
  }

  // Sayfanın gövdesinin oluşturulması
  Widget _buildBody() {
    return SingleChildScrollView(  // İçeriği kaydırılabilir hale getirir
      child: Column(  // Sayfa içeriği dikeyde düzenlenir
        crossAxisAlignment: CrossAxisAlignment.start,  // Başlangıç noktasına hizalama
        children: [
          // Dış Container
          Container(
            padding: EdgeInsets.all(16.0),  // Container içine 16 piksel boşluk eklenir
            decoration: BoxDecoration(
              color: Colors.grey[200],  // Arka plan rengini açık gri yapar
              borderRadius: BorderRadius.circular(10),  // Köşeleri yuvarlatır
              boxShadow: [
                BoxShadow(//gölge ekleme için
                  color: Colors.grey.withOpacity(0.7),  // Gölge rengi
                  spreadRadius: 2,  // Gölgenin yayılma mesafesi
                  blurRadius: 10,  // Gölgenin bulanıklığı
                  offset: Offset(0, 5),  // Gölgenin kayma mesafesi
                ),
              ],
            ),
            child: Column(  // İçerik için yeni bir Column başlatılır
              crossAxisAlignment: CrossAxisAlignment.start,  // Başlangıç noktasına hizalama
              children: [
                // Başlık bölümü
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8.0),  // Başlık için sola ve yukarıya boşluk eklenir
                  child: Text(
                    'Kişisel Bilgiler',  // Başlık metni
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),  // Başlık stilini belirler
                  ),
                ),
                SizedBox(height: 16),  // Başlık ile içerik arasında boşluk

                Container(
                  width: double.infinity,  // Genişliği ekrana yayar
                  height: 4,  // Yüksekliği 4 piksel yapar
                  color: Color(0xFF6D06CC),  // Mor renk çizgi ekler
                ),
                // İçerik Container'ı
                Container(
                  padding: EdgeInsets.all(16.0),  // İçeriğin etrafına 16 piksel boşluk ekler
                  decoration: BoxDecoration(
                    color: Colors.white,  // Arka planı beyaz yapar
                    borderRadius: BorderRadius.circular(10),  // Köşeleri yuvarlatır
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,  // İçeriği sola hizalar
                    children: [
                      // Profil Bilgileri Kartı
                      _buildProfileCard(),

                      SizedBox(height: 20),  // Kartlar arasında boşluk bırakılır

                      // Genel Bilgiler Kartı
                      _buildGeneralInfoCard(),

                      SizedBox(height: 20),  // Kartlar arasında boşluk bırakılır

                      // İletişim ve Adres Bilgileri Kartı
                      _buildCard(
                        title: 'İLETİŞİM VE ADRES BİLGİLERİ',  // Kart başlığı
                        content: _buildContactInfo(),  // Kart içeriği
                      ),

                      SizedBox(height: 20),  // Kartlar arasında boşluk bırakılır

                      // İptal ve Kaydet Butonları
                      _buildActionButtons(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Profil Bilgileri Kartı
  Widget _buildProfileCard() {
    return Card(
      elevation: 4,  // Kartın gölgesi
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),  // Kartın köşeleri yuvarlatılır
      ),
      color: Colors.white,  // Kartın arka plan rengi
      child: Padding(
        padding: const EdgeInsets.all(16.0),  // Kart içi boşluk
        child: Row(  // Kart içeriği yatayda düzenlenir
          children: [
            CircleAvatar(  // Profil resmi için dairesel alan
              backgroundImage: AssetImage('assets/images/a.jpg'),  // Resmin yolu
              radius: 40,  // Yarıçap (profil resmi boyutu)
            ),
            SizedBox(width: 20),  // Profil resmi ile yazı arasına boşluk ekler
            Expanded(  // Yazı alanını genişletir
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,  // Başlangıç noktasına hizalama
                children: [
                  Text(
                    'İREM NUR BULUT',  // Kişinin adı
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),  // Yazı stili
                  ),
                  Text(
                    'Öğrenci No: 211229019',  // Öğrenci numarası
                    style: TextStyle(fontSize: 16, color: Colors.grey),  // Yazı stili
                  ),
                  Text(
                    'Sınıf: 4',  // Sınıf bilgisi
                    style: TextStyle(fontSize: 16, color: Colors.grey),  // Yazı stili
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Genel Bilgiler Kartı
  Widget _buildGeneralInfoCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(  // Genel bilgi kartı için simge
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.info, color: Colors.white),  // Simge
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'GENEL BİLGİLER',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('Kayıt Tarihi: 04 Eylül 2021', style: TextStyle(fontSize: 16)),
                      Text('Danışman: mmtozlu@ktun.edu.tr', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // İletişim ve Adres Bilgileri
  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,  // Başlangıç noktasına hizalama
      children: [
        _buildLabel('Telefon'),  // Etiket
        _buildTextField(
          initialValue: '905452865020',  // Varsayılan telefon numarası
          textInputAction: TextInputAction.next,  // Enter tuşuna basıldığında bir sonraki alana geç
        ),
        SizedBox(height: 10),  // Alanlar arasında boşluk bırakır
        _buildLabel('E-Posta'),  // Etiket
        _buildTextField(
          initialValue: 'iiremblt@gmail.com',  // Varsayılan e-posta
          textInputAction: TextInputAction.next,  // Bir sonraki alana geçme aksiyonu
        ),
        SizedBox(height: 10),
        _buildLabel('Adres'),  // Etiket
        _buildTextField(
          initialValue: 'SANATORYUM CADDESİ ÇİÇEKLİ MAH 97/3',  // Varsayılan adres
          maxLines: 2,  // Adres alanı 2 satır olabilmesi için
          textInputAction: TextInputAction.done,  // Son alanda 'Done' tuşu gösterilecek
        ),
      ],
    );
  }

  // Aksiyon butonları (İptal ve Kaydet)
  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,  // Butonlar arasına eşit boşluk bırakır
      children: [
        ElevatedButton(
          onPressed: () {
            // İptal butonuna tıklanıldığında yapılacaklar
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),  // Kırmızı renk
          child: Text(
            'İptal',  // Buton metni
            style: TextStyle(color: Colors.white),  // Yazı rengi beyaz
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Kaydet butonuna tıklanıldığında yapılacaklar
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),  // Yeşil renk
          child: Text(
            'Kaydet',  // Buton metni
            style: TextStyle(color: Colors.white),  // Yazı rengi beyaz
          ),
        ),
      ],
    );
  }

  // Genel kart yapısı
  Widget _buildCard({required String title, required Widget content}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,  // Kartın rengi
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  // Başlangıç noktasına hizalama
          children: [
            Text(
              title,  // Kart başlığı
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            content,  // Kart içeriği
          ],
        ),
      ),
    );
  }

  // Etiket (başlık) oluşturur
  Widget _buildLabel(String text) {
    return Text(
      text,  // Etiket metni
      style: TextStyle(fontSize: 16),  // Yazı boyutu
    );
  }

  // TextField bileşeni oluşturur
  Widget _buildTextField({required String initialValue, int maxLines = 1, TextInputAction textInputAction = TextInputAction.done}) {
    return TextFormField(
      initialValue: initialValue,  // Başlangıç değeri
      maxLines: maxLines,  // Maksimum satır sayısı
      textInputAction: textInputAction,  // Enter tuşuna basıldığında ne yapılacağı
      decoration: InputDecoration(
        border: OutlineInputBorder(),  // Kenarlık
      ),
    );
  }
}