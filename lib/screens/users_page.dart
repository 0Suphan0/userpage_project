import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Expanded(flex: 1, child: Text("iWallet Users",style: TextStyle(fontSize: 40)),),
          const Expanded(flex: 1, child: TextField()),
          Expanded(
              flex: 5,
              child: ListView(
                children: [
                  Text("Hey",style: TextStyle(fontSize: 50),),
                  Text("Hey",style: TextStyle(fontSize: 50),),
                  Text("Hey",style: TextStyle(fontSize: 50),),
                  Text("Hey",style: TextStyle(fontSize: 50),),
                  Text("Hey",style: TextStyle(fontSize: 50),),
                  Text("Hey",style: TextStyle(fontSize: 50),),
                  Text("Hey",style: TextStyle(fontSize: 50),),
                  Text("Hey",style: TextStyle(fontSize: 50),),
                  Text("Hey",style: TextStyle(fontSize: 50),),
                  Text("Hey",style: TextStyle(fontSize: 50),),
                  Text("Hey",style: TextStyle(fontSize: 50),),
                ],
              ))
        ],
      ),
    );
  }
}
