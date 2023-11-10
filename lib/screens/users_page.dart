import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  final String projectTitle = "iWallet Users";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // keyboard acılınca ekran re-size olmasın.
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Text(projectTitle, style: TextStyle(fontSize: 40))),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: 'Kullanıcı Ara',
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: ListView(
                  children: [
                    buildUserCard(
                        "Ahmet Yılmaz", "@ahmet", Icons.chevron_right),
                    buildUserCard(
                        "Ahmet Yılmaz", "@ahmet", Icons.chevron_right),
                    buildUserCard(
                        "Ahmet Yılmaz", "@ahmet", Icons.chevron_right),
                    buildUserCard(
                        "Ahmet Yılmaz", "@ahmet", Icons.chevron_right),
                    buildUserCard(
                        "Ahmet Yılmaz", "@ahmet", Icons.chevron_right),
                    buildUserCard(
                        "Ahmet Yılmaz", "@ahmet", Icons.chevron_right),
                    buildUserCard(
                        "Ahmet Yılmaz", "@ahmet", Icons.chevron_right),
                    buildUserCard(
                        "Ahmet Yılmaz", "@ahmet", Icons.chevron_right),
                    buildUserCard(
                        "Ahmet Yılmaz", "@ahmet", Icons.chevron_right),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserCard(String name, String username, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4), // sağdan soldan 4
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(30.0), // circular kenarlar 30 set edildi.
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(name, style: TextStyle(fontSize: 20)),
          subtitle: Text(username, style: TextStyle(fontSize: 16)),
          trailing: Icon(iconData),
          onTap: () {},
        ),
      ),
    );
  }
}
