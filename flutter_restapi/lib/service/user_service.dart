/*import 'dart:convert';
import "package:http/http.dart" as http;

class UserService {
  final String apiUrl = "http://10.255.255.89:5000"; // Python sunucusunun URL'si

  Future<bool> login(String username, String password) async {
    final response = await http.get(
      Uri.parse("$apiUrl/login?kullaniciAdi=$username&sifre=$password"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // API'den dönen yanıta göre işlem yap
      var data = jsonDecode(response.body);
      if (data['success'] == true) {
        return true;
      }
    }
    return false;
  }
}*/
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  final String apiUrl = "http://10.255.255.89:5000"; // Python sunucusunun URL'si

  Future<bool> login(String username, String password) async {
    print('Kullanıcı Adı: $username, Şifre: $password'); // Kullanıcı adı ve şifreyi kontrol etmek için yazdırıyoruz

    try {
      final response = await http.get(
        Uri.parse("$apiUrl/login?kullaniciAdi=$username&sifre=$password"),
        headers: {'Content-Type': 'application/json'},
      );

      // API yanıt kodunu yazdır
      print('API Yanıt Kodu: ${response.statusCode}');

      // API'den gelen yanıtı kontrol et
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('API Yanıtı: $data'); // API yanıtını yazdır

        // API yanıtında 'success' parametresi doğru şekilde kontrol edilmelidir
        if (data['success'] == true) {
          print("Giriş Başarılı");
          return true; // Giriş başarılı
        } else {
          print('Error: ${data['message']}'); // Hata mesajını yazdır
        }
      } else {
        print('Error: ${response.statusCode}'); // API hatası durumunda
      }
    } catch (e) {
      print('Hata: $e'); // Hata mesajını yazdır
    }
    return false; // Başarısız giriş
  }
}












