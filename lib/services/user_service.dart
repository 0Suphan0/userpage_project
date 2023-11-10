import 'dart:convert';
import 'package:http/http.dart' as http;

import '../entity/user.dart';

class UserService{
  Future<List<User>> getAllUsers() async {
    const url='https://jsonplaceholder.typicode.com/users'; //istek atılan url.
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Başarılı bir şekilde veri alındı, JSON'ı listeye döndür...
      List<dynamic> jsonList = json.decode(response.body);
      List<User> userList = jsonList.map((json) => User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        phoneNumber: json['phone'],
        address: json['address']['street'],
        city: json['address']['city'],
        location: 'Lat: ${json['address']['geo']['lat']}, Long: ${json['address']['geo']['lng']}',
      )).toList();

      return userList;
    } else {
      // Hata durumunda 
      print('hata oluştu.');
      return [];
    }
  }

  Future<User?> getUserById(int id) async {
    final url = 'https://jsonplaceholder.typicode.com/users/$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      User user = User(
        id: jsonData['id'],
        name: jsonData['name'],
        username: jsonData['username'],
        email: jsonData['email'],
        phoneNumber: jsonData['phone'],
        address: jsonData['address']['street'],
        city: jsonData['address']['city'],
        location: 'Lat: ${jsonData['address']['geo']['lat']}, Long: ${jsonData['address']['geo']['lng']}',
      );

      return user;
    } else {
      // Hata durumunda
      print('Hata oluştu.');
      return null;
    }
  }





}
