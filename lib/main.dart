import 'package:flutter/material.dart';
import 'package:iwallet_userpage_project/provider/user_provider.dart';
import 'package:iwallet_userpage_project/screens/users_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>UserProvider(),
      child: MaterialApp(
        title: 'iWallet',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor:Color.fromRGBO(2, 54, 113, 1)), // rgb iWallet icon ile aynı.
          useMaterial3: true,
        ),
        home: const UserPage(),
      ),
    );
  }
}
