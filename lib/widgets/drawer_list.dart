import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Joab Santos"),
              accountEmail: Text("joab@hotmali.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/1.jpg"),
              ),
            ),

            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("Mias informações"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('Item 1');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Ajuda"),
              subtitle: Text("Mias informações"),
              trailing: Icon(Icons.help),
              onTap: () {
                print('Item 1');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Logout"),
              subtitle: Text("Mias informações"),
              trailing: Icon(Icons.all_out),
              onTap: () {
                print('Item 1');
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
