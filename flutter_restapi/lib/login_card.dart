import 'package:flutter/material.dart';
import 'package:flutter_restapi/service/user_service.dart';
import 'package:flutter_restapi/BasePage.dart';
import 'UserDetailsPage.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key});

  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  String message = '';

  void _login() async {
    setState(() {
      isLoading = true;
      message = '';
    });

    //String email = emailController.text.split('@')[0];  // @'den önceki kısmı al
    UserService _service = UserService();
    bool isAuthenticated = await _service.login(
      emailController.text,  // sadece kullanıcı adı kısmı
      passwordController.text,
    );


    setState(() {
      isLoading = false;
      message = isAuthenticated ? '' : 'Hatalı kullanıcı adı veya şifre';
    });

    if (isAuthenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BasePage(
            email: emailController.text,
            password: passwordController.text,
            bodyContent: UserDetailsPage(
              email: emailController.text,
              password: passwordController.text,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildLogoAndDescription(),
                  const SizedBox(height: 20),
                  _buildEmailField(),
                  const SizedBox(height: 10),
                  _buildPasswordField(),
                  const SizedBox(height: 20),
                  _buildLoginButton(),
                  const SizedBox(height: 20),
                  Text(message),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogoAndDescription() {
    return Column(
      children: [
        Image.network(
          'https://obsogrenci.ktun.edu.tr/Content/images/logo.png',
          height: 80.0,
        ),
        const SizedBox(height: 20),
        const Text(
          'Email adresiniz ve erişim şifreniz ile giriş yapabilirsiniz',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.black54),
        suffixText: '@ktun.edu.tr',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black54),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'Şifre',
        labelStyle: TextStyle(color: Colors.black54),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black54),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      obscureText: true,
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: isLoading ? null : _login,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        minimumSize: MaterialStateProperty.all<Size>(Size(200, 48)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: isLoading
          ? CircularProgressIndicator()
          : const Text('Giriş'),
    );
  }
}



