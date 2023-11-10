import 'package:flutter/cupertino.dart';
import 'package:iwallet_userpage_project/services/user_service.dart';

import '../entity/user.dart';

//yayın yapacağım state objem bu class.

class UserProvider extends ChangeNotifier{
  final UserService _service=UserService();
  List<User> _users = [];
  List<User> get users => _users;
  bool isLoading=false;

  //servisten veriyi çek tamamlanınca notify listeners ile değişikliği kaydet..
  Future<void> getAllUsers() async{

    isLoading=true;
    notifyListeners();

    final response=await _service.getAllUsers();
    _users=response;

    isLoading=false;
    notifyListeners();

    // iki defa notifylistenir'ın sebebi veriti tamamen yükledi mi onun kontrolü için...
  }

}