import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatefulWidget {
  static String routeName = "/settings";

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  //TODO -------------------------------MOVE-----------------------------------

  DatabaseReference DBRef = FirebaseDatabase.instance.reference();

  int relay1Status = 0;
  bool isLoading = false;

  getLEDStatus() async {
    await DBRef.child('relays/RELAY_1_STATUS').once().then((DataSnapshot snapshot) {
      relay1Status = snapshot.value;
      print(relay1Status);
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    isLoading = true;
    getLEDStatus();
    super.initState();
  }

  //TODO -------------------------------MOVE-----------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings UI')),
      body: buildSettingsList(),
    );
  }

  Widget buildSettingsList() {
    return SettingsList(
      sections: [
        SettingsSection(
          title: 'General',
          tiles: [
            SettingsTile(
              title: 'Language',
              subtitle: 'English',
              leading: Icon(Icons.language),
              onPressed: (BuildContext context) {},
            ),
            SettingsTile.switchTile(
              title: 'Use fingerprint',
              leading: Icon(Icons.fingerprint),
              switchValue: true,
              onToggle: (bool value) {
                setState(() {
                  value = false;
                });
              },
            ),
          ],
        ),
        SettingsSection(
          title: 'Relays',
          tiles: [
            SettingsTile.switchTile(
              title: 'Relay 1 status',
              leading: Icon(Icons.lightbulb),
              switchValue: relay1Status == 0 ? false : true,
              onToggle: (bool value) {
                setState(() {
                  if(relay1Status == 0) {
                    value = false;
                  } else if (relay1Status == 1) {
                    value = true;
                  }
                  changeLEDStatus();
                });
              },
            ),
          ],
        )
      ],
    );
  }

  void changeLEDStatus() {
    relay1Status == 0
        ? DBRef.child('relays/RELAY_1_STATUS').set(1)
        : DBRef.child('relays/RELAY_1_STATUS').set(0);
    if (relay1Status == 0) {
      setState(() {
        relay1Status = 1;
      });
    } else {
      setState(() {
        relay1Status = 0;
      });
    }
  }
}
