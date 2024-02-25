import 'package:merchant_senbu/services/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

saveLogin(String userToken, String refressToken, String emailUser) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('userToken', userToken);
  prefs.setString('refressToken', refressToken);
  prefs.setString('emailUser', emailUser);
  prefs.setBool('login', true);
  SecureStorage secureStorage = SecureStorage();
  await secureStorage.writeSecureData("userToken", userToken);
  await secureStorage.writeSecureData("nameUser", refressToken);
  await secureStorage.writeSecureData("emailUser", emailUser);
  await secureStorage.writeSecureData("login", 'true');
}

logOut() async {
  print("logout");
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('userToken', '');
  prefs.setString('refressToken', '');
  prefs.setString('emailUser', '');
  prefs.setBool('login', false);
  SecureStorage secureStorage = SecureStorage();
  secureStorage.writeSecureData("userToken", '');
  secureStorage.writeSecureData("nameUser", '');
  secureStorage.writeSecureData("emailUser", '');
  secureStorage.writeSecureData("login", 'false');
}
