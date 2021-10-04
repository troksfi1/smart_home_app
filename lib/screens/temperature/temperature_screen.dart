import 'package:caravan_app/components/lineChart/line_chart_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/temp_line_chart_widget.dart';

class Temperature extends StatefulWidget {
  static String routeName = "/temperature";

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {

  final dbRef = FirebaseDatabase.instance.reference();
  int currentTemp = 0;
  bool isLoading = false;

  getActTemp() async {
    //dbRef.child('temperature').set(currentTemp);
    await dbRef.child('temperature').once().then((DataSnapshot snapshot) {
      currentTemp = snapshot.value;
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    isLoading = true;
    getActTemp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Temperature'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.green,
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.green,
                child: Center(
                  child: Text(currentTemp.toString() + '°C',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
                height: 400,
                color: Colors.white60,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: TempLineChartWidget(),
                )),
          ],
        ),
      );
}
