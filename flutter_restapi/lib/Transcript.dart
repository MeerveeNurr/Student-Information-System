import 'package:flutter/material.dart';
import 'BasePage.dart';

class Transcript {
  final String dersKodu;
  final String yil;
  final String dersAdi;
  final String ects;
  final String harfNotu;

  Transcript({
    required this.dersKodu,
    required this.yil,
    required this.dersAdi,
    required this.ects,
    required this.harfNotu,
  });
}

class TranscriptPage extends StatelessWidget {
  final String email;
  final String password;

  TranscriptPage({required this.email, required this.password});

  final List<Transcript> transcriptList = [
    // 2021-22 Güz Dönemi
    Transcript(dersKodu: '1229101', yil: '2022', dersAdi: 'Bilgisayar Bilimlerine Giriş', ects: '5', harfNotu: 'BB'),
    Transcript(dersKodu: '1229102', yil: '2022', dersAdi: 'Matematik I', ects: '5', harfNotu: 'AA'),
    Transcript(dersKodu: '1229103', yil: '2022', dersAdi: 'Türk Dili ve Edebiyatı I', ects: '2', harfNotu: 'AA'),
    Transcript(dersKodu: '1229104', yil: '2022', dersAdi: 'Atatürk İlk. ve İnk. Tarihi I', ects: '2', harfNotu: 'BB'),
    Transcript(dersKodu: '1229105', yil: '2022', dersAdi: 'Fizik I', ects: '5', harfNotu: 'BB'),
    Transcript(dersKodu: '1229106', yil: '2022', dersAdi: 'İngilizce I', ects: '3', harfNotu: 'BB'),
    Transcript(dersKodu: '1229107', yil: '2022', dersAdi: 'Algoritma ve Programlama', ects: '6', harfNotu: 'BA'),
    Transcript(dersKodu: '1229108', yil: '2022', dersAdi: 'İş Sağlığı ve Güvenliği I', ects: '2', harfNotu: 'BB'),

    // 2021-22 Bahar Dönemi
    Transcript(dersKodu: '1229201', yil: '2022', dersAdi: 'Yazılım Mühendisliğine Giriş', ects: '4', harfNotu: 'AA'),
    Transcript(dersKodu: '1229202', yil: '2022', dersAdi: 'Matematik II', ects: '7', harfNotu: 'BA'),
    Transcript(dersKodu: '1229203', yil: '2022', dersAdi: 'Türk Dili ve Edebiyatı II', ects: '2', harfNotu: 'BA'),
    Transcript(dersKodu: '1229204', yil: '2022', dersAdi: 'Atatürk İlk. ve İnk. Tarihi II', ects: '2', harfNotu: 'BA'),
    Transcript(dersKodu: '1229205', yil: '2022', dersAdi: 'Fizik II', ects: '5', harfNotu: 'BB'),
    Transcript(dersKodu: '1229206', yil: '2022', dersAdi: 'İngilizce II', ects: '3', harfNotu: 'BA'),
    Transcript(dersKodu: '1229207', yil: '2022', dersAdi: 'Programlama Dillerinin Temelleri', ects: '5', harfNotu: 'FF'),
    Transcript(dersKodu: '1229208', yil: '2022', dersAdi: 'İş Sağlığı ve Güvenliği II', ects: '2', harfNotu: 'BA'),

    // 2022-23 Güz Dönemi
    Transcript(dersKodu: '1230101', yil: '2022', dersAdi: 'Araştırma Yöntemleri', ects: '2', harfNotu: 'AA'),
    Transcript(dersKodu: '1230102', yil: '2022', dersAdi: 'Veri Yapıları', ects: '5', harfNotu: 'BB'),
    Transcript(dersKodu: '1230103', yil: '2022', dersAdi: 'Nesneye Yönelik Programlama', ects: '4', harfNotu: 'FF'),
    Transcript(dersKodu: '1230101', yil: '2022', dersAdi: 'Yazılım Gereksinimleri ve Analizi', ects: '6', harfNotu: 'AA'),
    Transcript(dersKodu: '1230102', yil: '2022', dersAdi: 'Ayrık Yapılar', ects: '5', harfNotu: 'BB'),
    Transcript(dersKodu: '1230103', yil: '2022', dersAdi: 'Lineer Cebir', ects: '4', harfNotu: 'CC'),
    Transcript(dersKodu: '1230103', yil: '2022', dersAdi: 'Bilişim Hukuku', ects: '4', harfNotu: 'CC'),

    // 2022-23 Bahar Dönemi
    Transcript(dersKodu: '1230101', yil: '2022', dersAdi: 'Girişimcilik', ects: '2', harfNotu: 'AA'),
    Transcript(dersKodu: '1230102', yil: '2022', dersAdi: 'İleri Programlama Dilleri', ects: '5', harfNotu: 'BB'),
    Transcript(dersKodu: '1230103', yil: '2022', dersAdi: 'Yazılım Tasarım Örüntüleri', ects: '4', harfNotu: 'CC'),
    Transcript(dersKodu: '1230101', yil: '2022', dersAdi: 'Veri Tabanı Tasarımı ve Yönetimi', ects: '6', harfNotu: 'AA'),
    Transcript(dersKodu: '1230102', yil: '2022', dersAdi: 'Diferansiyel Denklemler', ects: '5', harfNotu: 'BB'),
    Transcript(dersKodu: '1230103', yil: '2022', dersAdi: 'İstatistik ve İhtimaller Teorisi', ects: '4', harfNotu: 'CC'),


    // 2023-24 Güz Dönemi
    Transcript(dersKodu: '1231101', yil: '2023', dersAdi: 'İşletim Sistemleri', ects: '6', harfNotu: 'BA'),
    Transcript(dersKodu: '1231102', yil: '2023', dersAdi: 'Bilgisayar Ağları', ects: '5', harfNotu: 'AA'),
    Transcript(dersKodu: '1231101', yil: '2023', dersAdi: 'Yazılım Mimarisi', ects: '6', harfNotu: 'BA'),
    Transcript(dersKodu: '1230103', yil: '2022', dersAdi: 'Nesneye Yönelik Programlama', ects: '4', harfNotu: 'CC'),
    Transcript(dersKodu: '1231102', yil: '2023', dersAdi: 'Web Teknolojileri', ects: '5', harfNotu: 'AA'),
    Transcript(dersKodu: '1231101', yil: '2023', dersAdi: 'Hesaplama Teorisi', ects: '6', harfNotu: 'BA'),
    Transcript(dersKodu: '1231102', yil: '2023', dersAdi: 'Dijital Sinyal İşleme', ects: '5', harfNotu: 'AA'),
    Transcript(dersKodu: '1231102', yil: '2023', dersAdi: 'Görsel Programlama', ects: '5', harfNotu: 'AA'),

    // 2023-24 Bahar Dönemi
    Transcript(dersKodu: '1231101', yil: '2023', dersAdi: 'Kriptografiye Giriş', ects: '6', harfNotu: 'BA'),
    Transcript(dersKodu: '1231102', yil: '2023', dersAdi: 'Yazılım Proje Yönetimi', ects: '5', harfNotu: 'AA'),
    Transcript(dersKodu: '1231101', yil: '2023', dersAdi: 'Yazılım Mühendisliği Uygulaması-I', ects: '6', harfNotu: 'BA'),
    Transcript(dersKodu: '1231102', yil: '2023', dersAdi: 'Mobil Programlama', ects: '5', harfNotu: 'AA'),
    Transcript(dersKodu: '1231101', yil: '2023', dersAdi: 'Veritabanı Sistemleri ve Programlama', ects: '6', harfNotu: 'BA'),
    Transcript(dersKodu: '1231102', yil: '2023', dersAdi: 'Evrimsel Hesaplamaya Giriş', ects: '5', harfNotu: 'AA'),


    // 2024-25 Güz Dönemi
    Transcript(dersKodu: '1232101', yil: '2024', dersAdi: 'Yazılım Mühendisliği Uygulaması-II', ects: '6', harfNotu: '-'),
    Transcript(dersKodu: '1232102', yil: '2024', dersAdi: 'Mesleki Staj', ects: '5', harfNotu: '-'),
    Transcript(dersKodu: '1232101', yil: '2024', dersAdi: 'Makine Öğrenmesine Giriş', ects: '6', harfNotu: '-'),
    Transcript(dersKodu: '1232102', yil: '2024', dersAdi: 'Blokzinciri Teknolojileri', ects: '5', harfNotu: '-'),
    Transcript(dersKodu: '1232101', yil: '2024', dersAdi: 'Biyomedikal Yazılımlar', ects: '6', harfNotu: '-'),
  ];

  @override
  Widget build(BuildContext context) {
    return BasePage(
      email: email,
      password: password,
      bodyContent: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Transkript',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          _buildTranscriptTable('2021-22 Güz Dönemi', transcriptList.sublist(0, 8)),
          _buildTranscriptTable('2021-22 Bahar Dönemi', transcriptList.sublist(8, 16)),
          _buildTranscriptTable('2022-23 Güz Dönemi', transcriptList.sublist(16, 23)),
          _buildTranscriptTable('2022-23 Bahar Dönemi', transcriptList.sublist(23, 29)),
          _buildTranscriptTable('2023-24 Güz Dönemi', transcriptList.sublist(29, 36)),
          _buildTranscriptTable('2023-24 Bahar Dönemi', transcriptList.sublist(36, 43)),
          _buildTranscriptTable('2024-25 Güz Dönemi', transcriptList.sublist(43, 47)),
        ],
      ),

    );
  }

  Widget _buildTranscriptTable(String term, List<Transcript> courses) {
    return Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(16.0),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 4,
                  color: Colors.orange,
                  margin: EdgeInsets.only(bottom: 8),
                ),
                Text(
                  term,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Ders Kodu')),
                      DataColumn(label: Text('Yıl')),
                      DataColumn(label: Text('Ders Adı')),
                      DataColumn(label: Text('ECTS')),
                      DataColumn(label: Text('Harf Notu')),
                    ],

                    rows: courses.map((transcript) {
                      final rowColor = transcript.harfNotu == 'FF'
                          ? MaterialStateProperty.all(Colors.red.withOpacity(0.3))
                          : transcript.harfNotu == '-'
                          ? MaterialStateProperty.all(Colors.white)
                          : MaterialStateProperty.all(Colors.green.withOpacity(0.3));

                      return DataRow(
                        color: rowColor,
                        cells: [
                          DataCell(Text(
                            transcript.dersKodu,
                            style: TextStyle(
                              color: transcript.harfNotu == 'FF' ? Colors.white : Colors.black,
                            ),
                          )),
                          DataCell(Text(transcript.yil)),
                          DataCell(Text(transcript.dersAdi)),
                          DataCell(Text(transcript.ects)),
                          DataCell(Text(transcript.harfNotu)),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            ),
       );
    }
}
