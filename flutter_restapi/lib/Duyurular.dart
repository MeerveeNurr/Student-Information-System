import 'package:flutter/material.dart';
import 'BasePage.dart';

class DuyurularPage extends StatelessWidget {
  final String email;
  final String password;
  final Widget? bodyContent;

  DuyurularPage({required this.email, required this.password, required this.bodyContent});


  @override
  Widget build(BuildContext context) {
    return BasePage(
      email: email,
      password: password,
      bodyContent: bodyContent ??
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                buildDuyuruCard('21 EKİM 2024', 'Uluslararası Öğrencilerin İkamet İzin İşlemleri Hk.'),
                buildDuyuruCard('18 EKİM 2024', 'Türkiye Siber Vatan Programı Konya Teknik Üniversitesinde Başlıyor'),
                buildDuyuruCard('11 EKİM 2024', 'Gelişim Yerleşkesi Otoparklarına Girişlerde Kullanılan RFİD Kart ve Araç...'),
                buildDuyuruCard('10 EKİM 2024', 'Ücretsiz Yemek Yardımı Hakkında Duyuru'),
              ],
            ),
          ),
    );
  }

  Widget buildDuyuruCard(String date, String title) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tarih kısmı solda olacak şekilde ayarlanıyor
            Container(
              width: 80, // Tarih için sabit bir genişlik veriyoruz
              padding: EdgeInsets.only(right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    date.split(' ')[0],
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFA11106),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    date.split(' ')[1] + '\n' + date.split(' ')[2],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Kırmızı çizgi ekleme
                  Divider(
                    color: Color(0xFFA11106),
                    thickness: 2, // Çizginin kalınlığı
                  ),
                ],
              ),
            ),
            // Duyuru başlığı ve devamını oku kısmı sağda olacak şekilde ayarlanıyor
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // Devamını oku butonuna basıldığında yapılacaklar
                      },
                      icon: Icon(Icons.arrow_forward, size: 16,color: Colors.black),
                      label: Text(
                        'Devamını Oku',
                        style: TextStyle(color: Colors.black), // Burada yazı rengini siyah yapıyoruz
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


