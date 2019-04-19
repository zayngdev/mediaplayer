import 'SongItem.dart';
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
    return LayoutBuilder(builder: (context, constraint) {
      final height = constraint.maxHeight;
      final width = constraint.maxWidth;

      return Stack(
        children: <Widget>[
          Container(
            color: backgroundColor,
          ),
          Positioned(
            left: -(height / 2 - width / 2),
            bottom: height * 0.25,
            child: Container(
              height: height,
              width: height,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: firstCircleColor,
              ),
            ),
          ),
          Positioned(
            left: width * 0.20,
            top: -width * 0.8,
            bottom: height * 0.25,
            child: Container(
              height: width * 1.6,
              width: width * 1.6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: firstCircleColor,
              ),
            ),
          ),
          Positioned(
            right: -width * 0.2,
            top: -50,
            child: Container(
              height: width * 0.6,
              width: width * 0.6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: thirdCircleColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: ListView(
              children: <Widget>[
                SizedBox(height: 32.0),
               // CustomTextField(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
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
        ],
      );
    });
  }
}
