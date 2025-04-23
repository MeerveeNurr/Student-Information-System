import 'package:flutter/material.dart';
import 'package:flutter_restapi/BasePage.dart';

class HarcDurumuPage extends StatelessWidget {
  final String email;
  final String password;

  HarcDurumuPage({required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      email: email,
      password: password,
      bodyContent: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Sola hizalama
        children: [
          Text(
            'Harç Durumu', // Harc Durumu'nu düzelttim
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Listelenecek harç bilgisi bulunmamaktadır.',
              style: TextStyle(fontSize: 15, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
