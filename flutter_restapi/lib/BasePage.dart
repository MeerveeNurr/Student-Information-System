import 'package:flutter/material.dart';
import 'package:flutter_restapi/UserDetailsPage.dart';
import 'AktifDonemNotlarim.dart';
import 'Duyurular.dart';
import 'NoteStatus.dart';
import 'PersonalInformation.dart';
import 'Transcript.dart';
import 'harcDurumu.dart';
import 'main.dart';

import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final String email;
  final String password;
  final Widget? bodyContent;
   // Dinamik başlık için yeni parametre eklendi

  BasePage({
    required this.email,
    required this.password,
    required this.bodyContent // bodyContent de zorunlu
   // Opsiyonel başlık parametresi
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        title: Row(
          children: [
            Image.network(
              'https://obsogrenci.ktun.edu.tr/Content/images/logo.png',
              height: 50.0,
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
      drawer: _buildDrawer(context),
      body: bodyContent, // Yalnızca bodyContent kısmı gösterilecek
    );
  }

  // Drawer ile ilgili diğer kodlar burada
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(''),
                  radius: 40,
                ),
                SizedBox(height: 10),
                Text(
                  'İrem Nur Bulut',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'Öğrenci No: 211229019',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
          _buildDrawerItem(Icons.home, 'Anasayfa', () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => UserDetailsPage(email: email, password: password),
              ),
            );
          }),

          _buildDrawerItem(Icons.access_alarm, 'Duyurular', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DuyurularPage(email: email, password: password, bodyContent: null,)),
            );
          }),
          _buildDrawerItem(Icons.person, 'Kişisel Bilgiler', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PersonalInformationPage(email: email, password: password,)),
            );
          }),
          _buildDrawerItem(Icons.grade, 'Aktif Dönem Notlarım', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>AktifDonemNotlarimPage(email: email, password: password)), // Harç Durumu sayfasına yönlendirme
            );
          }),
          _buildDrawerItem(Icons.money, 'Harç Durumu', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HarcDurumuPage(email: email, password: password,)), // Harç Durumu sayfasına yönlendirme
            );
          }),
          _buildDrawerItem(Icons.book, 'Not Durumu', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => noteStatusPage(email: email, password: password,)),
            );
          }),
          _buildDrawerItem(Icons.description, 'Transkript', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TranscriptPage(email: email, password: password,)), // Transkript sayfasına yönlendirme
            );
          }),

          _buildDrawerItem(Icons.exit_to_app, 'Çıkış Yap', () {
            _navigateToLoginPage(context); // Giriş yap ekranına yönlendir
          }),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, GestureTapCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }


  void _navigateToLoginPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
          (Route<dynamic> route) => false,
    );
  }
}
