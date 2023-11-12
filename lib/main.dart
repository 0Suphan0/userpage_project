import 'package:flutter/material.dart';
import 'package:iwallet_userpage_project/provider/user_provider.dart';
import 'package:iwallet_userpage_project/screens/users_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'iWallet',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(2, 54, 113, 1)),
          // genel tema rengi, icon'daki iWallet yazısı rgb ile aynı.

          useMaterial3: true,
        ),
        home: const UserPage(),
      ),
    );
  }
}
