import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iwallet_userpage_project/provider/user_provider.dart';
import 'package:iwallet_userpage_project/screens/user_detail_page.dart';
import 'package:provider/provider.dart';

import '../entity/user.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // input alanı için konroller
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // bunun sebebi tüm widget agacının cizilmesini bekle demek..
      // user listesini doldur...
      Provider.of<UserProvider>(context, listen: false).getAllUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //klavye input alanını daraltmasın.
      appBar: AppBar(),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.isLoading) {
            //veri yükleme devam ediyorsa indicator
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          //tüm userlar
          final users = userProvider.users;
          // filtreleme yapıldıktan sonra user'lar.
          List<User> filteredUsers = _filterUsers(users);

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
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          onChanged: (value) {
                            setState(
                                () {}); // setstate ile widget agacını değişiklik olunca yeniden çiz _filterUsers metodu çalışsın liste güncellensin.
                          },
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
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                searchController.clear();
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
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
                    child: filteredUsers.isNotEmpty
                        ? ListView.builder(
                            itemCount: filteredUsers.length,
                            itemBuilder: (context, index) {
                              return buildUserCard(
                                filteredUsers[index],
                                Icons.chevron_right,
                              );
                            },
                          )
                        : const Center(
                            child: Text(
                              'Kullanıcı Bulunamadı!',
                            ),
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

  List<User> _filterUsers(List<User> users) {
    String searchText = searchController.text.toLowerCase();
    if (searchText.isEmpty) {
      //eger input alanı boş ise
      return users;
    } else {
      // Burada hem username alanına göre hem de name alanına göre sorgu atılıyor. Where ve ok notasyonuyla.
      // dönen değer liste şeklinde geri dönülüyor.
      return users
          .where((user) =>
              user.username.toLowerCase().contains(searchText) ||
              user.name.toLowerCase().contains(searchText))
          .toList();
    }
  }

  Widget buildUserCard(User user, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Card(
        //iWallet icondaki renklerin sıralamasına göre item'lara color ata..
        color: user.id % 5 == 1
            ? Colors.deepPurple
            : user.id % 5 == 2
                ? Colors.red
                : user.id % 5 == 3
                    ? Colors.orange
                    : user.id % 5 == 4
                        ? Colors.yellow
                        : Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                user.profilePhotoUrl,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(user.name, style: TextStyle(fontSize: 20)),
          subtitle: Text('@${user.username}', style: TextStyle(fontSize: 16)),
          trailing: Icon(iconData),
          onTap: () async {
            Navigator.push(
              context,
              PageRouteBuilder(
                //animasyon
                opaque: false,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    // arka planı blurluyor.
                    child: ScaleTransition(
                      scale: animation,
                      child: UserDetailPopup(user: user), //tıklanan ilgili karttaki user'ı detail page'e gönder.
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
