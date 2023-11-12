import 'package:flutter/material.dart';

import '../entity/user.dart';

class UserDetailPopup extends StatelessWidget {
  final User? user;
  final String notAvailableText = 'N/A';

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
                user?.name ?? notAvailableText,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '@${user?.username ?? notAvailableText}',
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
                Text('Email: ${user?.email ?? notAvailableText}'),
                Text('Telefon No: ${user?.phoneNumber ?? notAvailableText}'),
                Text('Adres: ${user?.address ?? notAvailableText}'),
                Text('Şehir: ${user?.city ?? notAvailableText}'),
                Text('Konum: ${user?.location ?? notAvailableText}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color calculateBackgroundColor(int id) {
    switch (id % 5) {
      case 1:
        return Colors.deepPurple;
      case 2:
        return Colors.red;
      case 3:
        return Colors.orange;
      case 4:
        return Colors.yellow;
      default:
        return Colors.green;
    }
  }
}
