import 'package:dribbble_18/CustomTextfield.dart';
import 'package:dribbble_18/SongItem.dart';
import 'package:flutter/material.dart';
import 'StyleSheet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music player screen',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 32.0),
            CustomTextField(),
            SizedBox(
              height: 16.0,
            ),
            Text(
              'Recommend',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            SizedBox(
              height: 16.0,
            ),
            SongItem('In the Name of Love', 'Martin Garrix', martinGarrix),
            SongItem('Never Be Like You', 'Flume', flume),
            SongItem('Worry Bout Us', 'Rosie Lowe', rosieLowe),
            SongItem('In the Name of Love', 'Martin Garrix', martinGarrix),
            SongItem('In the Name of Love', 'Martin Garrix', martinGarrix),
          ],
        ),
      ),
    );
  }
}







