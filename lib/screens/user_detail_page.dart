import 'package:flutter/material.dart';

import '../entity/user.dart';

class UserDetailPopup extends StatelessWidget {
  final User? user;

  const UserDetailPopup({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: calculateBackgroundColor(user?.id ?? 0),
      scrollable: true,
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.network(
                      user?.profilePhotoUrl ?? '',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                user?.name ?? 'N/A',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '@${user?.username ?? 'N/A'}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email: ${user?.email ?? 'N/A'}'),
                Text('Telefon No: ${user?.phoneNumber ?? 'N/A'}'),
                Text('Adres: ${user?.address ?? 'N/A'}'),
                Text('Şehir: ${user?.city ?? 'N/A'}'),
                Text('Konum: ${user?.location ?? 'N/A'}'),
              ],
            ),
          ),
        ],
      ),

    );
  }

  //cardın arka plan rengini hesaplar.
  Color calculateBackgroundColor(int id) {
    switch (id % 4) {
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.blueAccent;
      case 3:
        return Colors.green;
      default:
        return Colors.red;
    }
  }
}
