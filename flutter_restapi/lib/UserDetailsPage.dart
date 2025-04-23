import 'package:flutter/material.dart';
import 'BasePage.dart'; // BasePage dosyasını import et

class UserDetailsPage extends StatelessWidget {
  final String email;
  final String password;

  UserDetailsPage({required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      email: email,
      password: password,
      bodyContent: _buildBody(), // Sadece içerik gösterilecek
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildStudentCard(),
        _buildAdvisorCard(),
      ],
    );
  }

  Widget _buildStudentCard() {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(''), // Profil fotoğrafı URL'i
              radius: 40,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildTitle('Öğrenci Bilgileri'),
                  _buildDivider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow('Ad Soyad:', 'İrem Nur Bulut'),
                      _buildInfoRow('Öğr. No:', '211229019'),
                      _buildInfoRow('Sınıf:', '3'),
                      _buildInfoRow('Mail:', 'f211229019@ktun.edu.tr'),
                      _buildInfoRow(
                        'Program:',
                        'Mühendislik ve Doğa Bilimleri Fakültesi / Yazılım Mühendisliği',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdvisorCard() {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTitle('Danışman Bilgileri'),
            _buildDivider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundImage: NetworkImage(''), // Danışman fotoğrafı URL'i
                radius: 30,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow('Ad Soyad:', 'Muhammet Mustafa Tozlu'),
                  _buildInfoRow('Mail:', 'mmtozlu@ktun.edu.tr'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 2,
      color: Colors.orange,
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
