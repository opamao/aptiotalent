import 'package:flutter/material.dart';

import '../../../../themes/themes.dart';
import '../../menus.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paramètres"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Paramètre de notification"),
              leading: Icon(
                Icons.notifications_outlined,
                color: appColor,
              ),
              trailing: Icon(
                Icons.navigate_next_outlined,
                color: appColor,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationSettingsPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Gérer mot de passe"),
              leading: Icon(
                Icons.lock_outline_rounded,
                color: appColor,
              ),
              trailing: Icon(
                Icons.navigate_next_outlined,
                color: appColor,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasswordManagerPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Supprimer son compte"),
              leading: Icon(
                Icons.delete_outline_outlined,
                color: appColor,
              ),
              trailing: Icon(
                Icons.navigate_next_outlined,
                color: appColor,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Thème"),
              leading: Icon(
                Icons.dark_mode_outlined,
                color: appColor,
              ),
              trailing: Icon(
                Icons.navigate_next_outlined,
                color: appColor,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
