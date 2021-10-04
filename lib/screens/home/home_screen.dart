import 'package:caravan_app/screens/co2/co2_screen.dart';
import 'package:caravan_app/screens/humidity/humidity_screen.dart';
import 'package:caravan_app/screens/settings/settings_screen.dart';
import 'package:caravan_app/screens/temperature/temperature_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Settings.routeName);
          },
          icon: const Icon(Icons.settings_outlined),
        ),

        title: const Text('My Van'),

        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.refresh,
            ),
            onPressed: () {},
          )
        ],

        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                  child: Text('Hello',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white
                  ),)
              ),
              color: Colors.green,
            ),
          ),
          InkWell(
            child: Container(
              height: 100,
              color: Colors.white60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 20),
                  const Icon(Icons.thermostat),
                  const SizedBox(width: 15),
                  const Text('15°C'),
                ],
              )
            ),
            onTap: () {
              Navigator.pushNamed(context, Temperature.routeName);
            },
          ),
          const Divider(
            height: 10,
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
          InkWell(
            child: Container(
                height: 100,
                color: Colors.white60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 20),
                    const Icon(Icons.waves),
                    const SizedBox(width: 15),
                    const Text('60 %'),
                  ],
                )
            ),
            onTap: () {
              Navigator.pushNamed(context, Humidity.routeName);
            },
          ),
          const Divider(
            height: 10,
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
          InkWell(
            child: Container(
                height: 100,
                color: Colors.white60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 20),
                    const Icon(Icons.workspaces_outline),
                    const SizedBox(width: 15),
                    const Text('60 %'),
                  ],
                )
            ),
            onTap: () {
              Navigator.pushNamed(context, CO2.routeName);
            },
          ),
        ],
      ),
    );
  }
}
