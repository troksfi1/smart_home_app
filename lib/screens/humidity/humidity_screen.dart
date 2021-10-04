import 'package:flutter/material.dart';

class Humidity extends StatelessWidget {
  static String routeName = "/humidity";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Humidity"),
      ),
    );
  }
}
