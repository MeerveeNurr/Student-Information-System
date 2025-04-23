import 'package:flutter/material.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notlarım Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(email: 'example@example.com', password: 'password'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String email;
  final String password;

  MyHomePage({required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return AktifDonemNotlarimPage(email: email, password: password);
  }
}

// BasePage sınıfının taslak hali
class BasePage extends StatelessWidget {
  final String email;
  final String password;
  final Widget bodyContent;

  BasePage({required this.email, required this.password, required this.bodyContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notlarım Uygulaması'),
      ),
      body: bodyContent,
    );
  }
}

// AktifDonemNotlarimPage sınıfı artık BasePage'den türetiliyor
class AktifDonemNotlarimPage extends BasePage {
  AktifDonemNotlarimPage({required String email, required String password})
      : super(
    email: email,
    password: password,
    bodyContent: _AktifDonemNotlarimBody(),
  );
}

// Sayfa içeriğini oluşturan özel bir widget
class _AktifDonemNotlarimBody extends StatefulWidget {
  @override
  _AktifDonemNotlarimBodyState createState() => _AktifDonemNotlarimBodyState();
}

class _AktifDonemNotlarimBodyState extends State<_AktifDonemNotlarimBody> {
  bool isDrawerOpen = false;

  void toggleDrawer() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            '2024-2025 Güz Dönemi',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text('Dönem Ortalaması: 0', style: TextStyle(fontSize: 16)),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 12.0,
                headingRowColor:
                MaterialStateProperty.resolveWith((states) => Colors.lightBlue[100]),
                columns: _buildColumns(),
                rows: _buildRows(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    return [
      DataColumn(label: SizedBox(width: 20, child: Icon(Icons.swap_horiz))),
      DataColumn(label: Text('Ders Kodu', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('Şube No', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('Yıl', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('Ders Adı', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('ECTS', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('Sınavlar', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('Genel Ortalama', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('Harf', style: TextStyle(fontWeight: FontWeight.bold))),
      DataColumn(label: Text('Durum', style: TextStyle(fontWeight: FontWeight.bold))),
    ];
  }

  List<DataRow> _buildRows(BuildContext context) {
    return [
      _buildDataRow(context, '1229104', '0', '2025', 'Atatürk İlk. ve İnk. Tarihi I', 2),
      _buildDataRow(context, '1229303', '0', '2025', 'Nesneye Yönelik Programlama', 6),
      _buildDataRow(context, '1229541', '0', '2025', 'Görsel Programlama', 4),
      _buildDataRow(context, '1229701', '3', '2025', 'Yazılım Mühendisliği Uygulamaları-II', 13),
      _buildDataRow(context, '1229702', '0', '2025', 'Mesleki Staj', 5),
      _buildDataRow(context, '1229743', '0', '2025', 'Makine Öğrenmesine Giriş', 4),
      _buildDataRow(context, '1229752', '0', '2025', 'Blokzinciri Teknolojileri', 4),
    ];
  }

  DataRow _buildDataRow(BuildContext context, String dersKodu, String subeNo, String yil, String dersAdi, int ects) {
    return DataRow(
      cells: [
        DataCell(IconButton(
          icon: Icon(Icons.settings, color: Colors.green),
          onPressed: () {
            _showExamDatesDialog(context, dersKodu);
          },
        )),
        DataCell(Text(dersKodu)),
        DataCell(Text(subeNo)),
        DataCell(Text(yil)),
        DataCell(Container(width: 200, child: Text(dersAdi))),
        DataCell(Text(ects.toString())),
        DataCell(
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: () {
              _showExamDatesDialog(context, dersKodu);
            },
            child: Text('Sınav Tarihleri'),
          ),
        ),
        DataCell(Text('-1')),  // Genel Ortalama sütununda -1 gösterilecek
        DataCell(Text('')),  // Harf sütunu boş bırakılacak
        DataCell(
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {},
            child: Text('Yeni', style: TextStyle(fontSize: 12)),
          ),
        ),
      ],
    );
  }

  void _showExamDatesDialog(BuildContext context, String dersKodu) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sınav Tarihleri'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Vize'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Final'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Bütünleme'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Kapat'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
