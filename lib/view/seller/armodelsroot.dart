import 'package:ar_base_plant_app/view/seller/Modelscreens/model3.dart';
import 'package:ar_base_plant_app/view/seller/armodels.dart';
import 'package:flutter/material.dart';

import 'Modelscreens/model2.dart';




class Armodels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rows Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/screen1': (context) => Model(),
        '/screen2': (context) => Model1(),
        '/screen3': (context) => Model2(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ar Models'),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/screen1');
            },
            child: Container(
              height: 160,
              width: double.infinity,
              color: Colors.blueAccent,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/plant-one.png',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'banana_plant_with_pot',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/screen2');
            },
            child: Container(
              height: 160,
              width: double.infinity,
              color: Colors.blueAccent,
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/plant-two.png",
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Plant',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/screen3');
            },
            child: Container(
              height: 160,
              width: double.infinity,
              color: Colors.blueAccent,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/plant-three.png',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'pot_plant_-_jade_plant',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}