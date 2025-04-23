import 'package:flutter/material.dart';
import 'BasePage.dart';

class noteStatusPage extends StatelessWidget {
  final String email;
  final String password;

  // Constructor: email ve password parametrelerini alır.
  noteStatusPage({required this.email, required this.password});

  // Örnek veri: Ders bilgileri ve notlar.
  final List<Map<String, dynamic>> data = [
    {
      'Ders Kodu': '1229101',
      'Yıl': '2022',
      'Ders Adı': 'Bilgisayar Bilimlerine Giriş',
      'ECTS': '5',
      'Sınavlar': 'Vize 80\nFinal 70',
      'Genel Ortalama': '74',
      'Harf': 'BA',
      'Durum': 'Başarılı',
    },
    {
      'Ders Kodu': '1229102',
      'Yıl': '2022',
      'Ders Adı': 'Matematik I',
      'ECTS': '5',
      'Sınavlar': 'Vize 75\nFinal 90',
      'Genel Ortalama': '84',
      'Harf': 'AA',
      'Durum': 'Başarılı',
    },
    {
      'Ders Kodu': '1229103',
      'Yıl': '2022',
      'Ders Adı': 'Türk Dili ve Edebiyatı I',
      'ECTS': '2',
      'Sınavlar': 'Vize 100\nFinal 100',
      'Genel Ortalama': '100',
      'Harf': 'AA',
      'Durum': 'Başarılı',
    },
    {
      'Ders Kodu': '1229104',
      'Yıl': '2022',
      'Ders Adı': 'Atatürk İlk. ve İnk. Tarihi I',
      'ECTS': '2',
      'Sınavlar': 'Vize 76\nFinal 72',
      'Genel Ortalama': '74',
      'Harf': 'BA',
      'Durum': 'Başarılı',
    },
    {
      'Ders Kodu': '1229105',
      'Yıl': '2022',
      'Ders Adı': 'Fizik I',
      'ECTS': '5',
      'Sınavlar': 'Vize 69\nFinal 64',
      'Genel Ortalama': '66',
      'Harf': 'BB',
      'Durum': 'Başarılı',
    },
  ];

  // Build metodu: widget'ı oluşturur ve render eder.
  @override
  Widget build(BuildContext context) {
    return BasePage(
      email: email,
      password: password,
      bodyContent: _buildBody(),  // Sayfanın ana içeriğini oluşturur
    );
  }

  // Ana içerik: Not durumları sayfasını oluşturan widget
  Widget _buildBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical, // Sayfanın dikey olarak kaymasını sağlar
      child: Column(
        children: [
          // Başlık kısmı
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,  // Başlık sola hizalanır
              child: Text(
                'Not Durumu',  // Başlık
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Başlık stilini ayarlar
              ),
            ),
          ),
          // Ders notları ve ortalamaları için container
          _buildDersNotOrtalamasiContainer(),
        ],
      ),
    );
  }

  // Ders notlarının ve genel ortalamaların bulunduğu container
  Widget _buildDersNotOrtalamasiContainer() {
    return Card(
      elevation: 4.0,  // Kartın gölgelendirilmesi
      margin: const EdgeInsets.all(16.0),  // Kartın etrafındaki boşluk
      child: Column(
        children: [
          // Mavi çizgi
          Container(
            height: 4.0,  // Çizginin yüksekliği
            color: Color(0xFF4340E3),  // Çizginin rengi
          ),
          // Ders notları ve genel ortalama bilgileri
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,  // Sol hizalama
              children: [
                // Genel Akademik Ortalama bilgisi
                Container(
                  color: Colors.greenAccent.withOpacity(0.3),  // Arka plan rengi
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Genel Akademik Ortalama: 4.00',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 16.0),
                // İlk dönem bilgisi
                _buildDersNotOrtalamasiWidget('2021-22 Güz Dönemi', 'Dönem Ortalaması: 3,52'),
                Divider(),  // Tabloyu ayıran çizgi
                // İkinci dönem bilgisi
                _buildDersNotOrtalamasiWidget('2021-22 Bahar Dönemi', 'Dönem Ortalaması: 3,75'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Ders notları ve ortalama bilgilerini içeren tabloyu oluşturur
  Widget _buildDersNotOrtalamasiWidget(String donemAd, String donemOrtalamasi) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,  // Tabloyu yatay kaydırabilmeyi sağlar
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  // Sol hizalama
          children: [
            // Dönem Başlığı ve Ortalaması
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Başlıkları iki kenara yerleştirir
              children: [
                Text(
                  donemAd,  // Dönem adı
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),  // Yazı stilini ayarlar
                ),
                SizedBox(width: 20),  // Başlıklar arasına boşluk
                Text(
                  donemOrtalamasi,  // Dönem ortalaması
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Derslerin ve notların bulunduğu tablo
            DataTable(
              columnSpacing: 30.0,  // Sütunlar arasındaki boşluk
              dataRowHeight: 60.0,  // Satır yüksekliği
              headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blue.shade50),  // Başlık satırının rengi
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),  // Tabloyu çevreleyen kenarlık
              ),
              columns: [
                DataColumn(label: Text('Ders Kodu', style: TextStyle(fontSize: 18))),
                DataColumn(label: Text('Yıl', style: TextStyle(fontSize: 18))),
                DataColumn(label: Text('Ders Adı', style: TextStyle(fontSize: 18))),
                DataColumn(label: Text('ECTS', style: TextStyle(fontSize: 18))),
                DataColumn(label: Text('Sınavlar', style: TextStyle(fontSize: 18))),
                DataColumn(label: Text('Genel Ortalama', style: TextStyle(fontSize: 18))),
                DataColumn(label: Text('Harf', style: TextStyle(fontSize: 18))),
                DataColumn(label: Text('Durum', style: TextStyle(fontSize: 18))),
              ],
              rows: data.map((row) {  // Her ders verisini tabloya ekler
                return DataRow(cells: [
                  DataCell(Text(row['Ders Kodu'].toString(), style: TextStyle(fontSize: 16))),
                  DataCell(Text(row['Yıl'].toString(), style: TextStyle(fontSize: 16))),
                  DataCell(Text(row['Ders Adı'].toString(), style: TextStyle(fontSize: 16))),
                  DataCell(Text(row['ECTS'].toString(), style: TextStyle(fontSize: 16))),
                  DataCell(Text(row['Sınavlar'].toString(), style: TextStyle(fontSize: 16))),
                  DataCell(Text(row['Genel Ortalama'].toString(), style: TextStyle(fontSize: 16))),
                  DataCell(Text(row['Harf'].toString(), style: TextStyle(fontSize: 16))),
                  DataCell(Container(
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.2),  // Durum kutusunun arka planı
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    child: Text(
                      row['Durum'].toString(),
                      style: TextStyle(color: Colors.green, fontSize: 16),  // Durum yazısı
                    ),
                  )),
                ]);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

