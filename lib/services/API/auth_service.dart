import 'package:merchant_senbu/services/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

saveLogin(String userToken, String refressToken, String emailUser,
    String role) async {
  SecureStorage secureStorage = SecureStorage();
  await secureStorage.writeSecureData("userToken", userToken);
  await secureStorage.writeSecureData("nameUser", refressToken);
  await secureStorage.writeSecureData("emailUser", emailUser);
  await secureStorage.writeSecureData("roleUser", role);
  await secureStorage.writeSecureData("login", 'true');
}

logOut() async {
  print("logout");
  SecureStorage secureStorage = SecureStorage();
  secureStorage.writeSecureData("userToken", '');
  secureStorage.writeSecureData("nameUser", '');
  secureStorage.writeSecureData("emailUser", '');
  secureStorage.writeSecureData("login", 'false');
}
