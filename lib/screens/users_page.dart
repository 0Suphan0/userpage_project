import 'package:flutter/material.dart';
import 'package:iwallet_userpage_project/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final String projectTitle = "iWallet Users";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<UserProvider>(context, listen: false).getAllUsers();
    });
    // widget oluşturulduktan hemen sonra asenkron bir şekilde verilerin yüklenmesini ve sayfanın güncellenmesini sağla
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          // Burada userProvider'ı state objem...
          if (userProvider.isLoading) {
            //yüklüyorsa indicator çalıştır..
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final users = userProvider.users;
          return Column(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset('assets/images/iWallet.png'),
              ),
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return buildUserCard(users[index].name,
                            users[index].username, Icons.chevron_right, index);
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildUserCard(
      String name, String username, IconData iconData, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Card(
        color: index % 4 == 1
            ? Colors.yellow
            : index % 4 == 2
                ? Colors.blueAccent
                : index % 4 == 3
                    ? Colors.green
                    : Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: ListTile(
          leading: const CircleAvatar(
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
