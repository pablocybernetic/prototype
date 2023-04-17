import 'package:shared_preferences/shared_preferences.dart';

void login() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('login', true);
}

Future<bool?> loginCheck() async {
  final prefs = await SharedPreferences.getInstance();
  bool? loginSave = prefs.getBool('login');
  return loginSave;
}

void save(String email, String password, String re_password,
    String phone_number) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
  prefs.setString('password', password);
  prefs.setString('re_password', re_password);
  prefs.setString('phone_number', phone_number);
}

void clear() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

Future<String?> readEmail() async {
  final prefs = await SharedPreferences.getInstance();
  String? reg_email = prefs.getString('email');
  return reg_email;
}

Future<String?> readPassword() async {
  final prefs = await SharedPreferences.getInstance();
  String? password = prefs.getString('password');
  return password;
}
