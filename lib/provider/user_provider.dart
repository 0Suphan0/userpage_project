import 'package:flutter/cupertino.dart';
import 'package:iwallet_userpage_project/services/user_service.dart';

import '../entity/user.dart';

//yayın yapacağım state objem bu class.

class UserProvider extends ChangeNotifier {
  final UserService _service = UserService();
  List<User> _users = [];

  List<User> get users => _users;
  bool isLoading = false;
  bool isLoadingId = false;

  //servisten veriyi çek tamamlanınca notify listeners ile değişikliği kaydet..
  Future<void> getAllUsers() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAllUsers();
    _users = response;

    isLoading = false;
    notifyListeners();

    // iki defa notifylistenir'ın sebebi veriti tamamen yükledi mi onun kontrolü için...
  }

  Future<User?> getUserById(int id) async {
    isLoadingId = true;
    notifyListeners();

    final user = await _service.getUserById(id);
    if (user != null) {
      isLoadingId = false;
      notifyListeners();
      return user;
    } else {
      print('hata');
    }

    isLoadingId = false;
    notifyListeners();
    return null;
  }
}
