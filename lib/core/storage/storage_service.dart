import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../constants/constant.dart';

class StorageService {

  final _secureStorage = const FlutterSecureStorage();

  final _keyEmail = Strings.email;
  final _keyPassword = Strings.password;
  final _keyIsFirstTimeLogin = Strings.isFirstTimeTrue;


  Future setEmail(String email) async {
      await _secureStorage.write(key: _keyEmail, value: email);
  }

  Future<String?> getEmail() async {
    return await _secureStorage.read(key: _keyEmail);
  }

  Future setPassword(String password) async {
    await _secureStorage.write(key: _keyPassword, value: password);
  }

  Future<String?> getPassword() async {
    return await _secureStorage.read(key: _keyPassword);
  }

  Future setIsFirstTimeLogin(String isFirstTime) async {
    await _secureStorage.write(key: _keyIsFirstTimeLogin, value: isFirstTime);
  }

  Future<String?> getIsFirstTimeLogin() async {
    return await _secureStorage.read(key: _keyIsFirstTimeLogin);
  }

}