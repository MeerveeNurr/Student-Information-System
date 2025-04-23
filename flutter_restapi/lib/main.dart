import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text(
              '',
              style: TextStyle(color: Colors.white),
            ),
            toolbarHeight: 14.0,
            centerTitle: true,
          ),
          body: const TabBarView(
            children: [
              HomePage(),
              //SignupCard(),
            ],
          ),
        ),
      ),
    );
  }
}


