import 'package:flutter/material.dart';

import '../../../../themes/themes.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() =>
      _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool light = true;

  static const WidgetStateProperty<Icon> thumbIcon =
      WidgetStateProperty<Icon>.fromMap(
    <WidgetStatesConstraint, Icon>{
      WidgetState.selected: Icon(Icons.check),
      WidgetState.any: Icon(Icons.close),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        title: Text("Paramètres notifications"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Notifications générales"),
              trailing: Transform.scale(
                scaleX: 0.7,
                scaleY: 0.7,
                child: Switch(
                  thumbIcon: thumbIcon,
                  value: light,
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text("Notifier lorsqu'un emploi est disponible"),
              trailing: Transform.scale(
                scaleX: 0.7,
                scaleY: 0.7,
                child: Switch(
                  thumbIcon: thumbIcon,
                  value: light,
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text("Notifier lorsqu'il y a une offre d'emploi"),
              trailing: Transform.scale(
                scaleX: 0.7,
                scaleY: 0.7,
                child: Switch(
                  thumbIcon: thumbIcon,
                  value: light,
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text("Mise à jour de l'application"),
              trailing: Transform.scale(
                scaleX: 0.7,
                scaleY: 0.7,
                child: Switch(
                  thumbIcon: thumbIcon,
                  value: light,
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  },
                ),
              ),
            ),
            ListTile(
              title: const Text("Mise à jour du statut de l'emploi"),
              trailing: Transform.scale(
                scaleX: 0.7,
                scaleY: 0.7,
                child: Switch(
                  thumbIcon: thumbIcon,
                  value: light,
                  onChanged: (bool value) {
                    setState(() {
                      light = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
