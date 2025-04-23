import 'package:flutter/material.dart';
import 'login_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Üst kısma logo ekleniyor
            Center(
              child: Image.network(
                'https://www.ktun.edu.tr/Content/images/logo/logo.png',
                height: 150.0,
              ),
            ),
            const SizedBox(height: 20), // Boşluk

            // Başlık
            const Text(
              "Duyurular",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Duyurular Listesi
            Expanded(
              child: ListView(
                children: [
                  buildAnnouncementItem('21', 'EKİM', '2024', 'Uluslararası Öğrencilerin İkamet İzin İşlemleri Hk.', 'https://example.com'),
                  buildAnnouncementItem('18', 'EKİM', '2024', 'Türkiye Siber Vatan Programı Konya Teknik...', 'https://example.com'),
                  buildAnnouncementItem('11', 'EKİM', '2024', 'Gelişim Yerleşkesi Otoparklarına Girişlerde...', 'https://example.com'),
                  buildAnnouncementItem('10', 'EKİM', '2024', 'Seçmeli Ders Seçim...', 'https://example.com'),
                  buildAnnouncementItem('10', 'EKİM', '2024', 'Seçmeli Ders Seçim...', 'https://example.com'),
                  buildAnnouncementItem('10', 'EKİM', '2024', 'Seçmeli Ders Seçim...', 'https://example.com'),
                ],
              ),
            ),
          ],
        ),
      ),
      // Giriş Sayfasına Git Butonunu Sabitleme
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginCard()), // LoginCard sayfasına yönlendirme
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Butonun arka plan rengini kırmızı yapma
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16), // Buton boyutunu büyütme
            textStyle: const TextStyle(fontSize: 18),
          ),
          child: const Text(
            'Giriş Sayfasına Git',
            style: TextStyle(color: Colors.white), // Yazı rengini beyaz yapma
          ),
        ),
      ),
    );
  }

  // Duyuru öğesini oluşturmak için yardımcı widget
  Widget buildAnnouncementItem(String day, String month, String year, String title, String url) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tarih kısmı
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  day,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Text(
                  month,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  year,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20), // Tarih ve başlık arasına boşluk ekleme

            // Başlık kısmı
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    // URL'yi açmak için tıklanabilir link
                    child: const Text(
                      'Devamını Oku →',
                      style: TextStyle(color: Colors.red, fontSize: 16, decoration: TextDecoration.none),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(color: Colors.red), // Çizgi rengini kırmızı yapma
      ],
    );
  }
}

// Ana uygulama
void main() {
  runApp(MaterialApp(
    home: const HomePage(),
    debugShowCheckedModeBanner: false, // Debug banner'ı kaldırmak için
  ));
}
