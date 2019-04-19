import 'dart:ui';

import 'package:flutter/material.dart';
import "StyleSheet.dart";

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class DetailedScreen extends StatefulWidget {
  final title;
  final artist;
  final image;
  final audioPath;

  DetailedScreen(this.title, this.artist, this.image, this.audioPath);

  @override
  State<StatefulWidget> createState() {
    return DetailedScreenState();
  }
}

class DetailedScreenState extends State<DetailedScreen> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  AudioPlayer audioPlayer;
  AudioCache audioCache;
  int currentSecond;
  int durationSeconds;
  String durationStirng;
  bool isPlaying;
  bool isFirstPlay;

  @override
  void initState() {
    super.initState();
    currentSecond = 0;
    isPlaying = false;
    initPlayer();
  }

  void initPlayer() {
    audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: audioPlayer);

    audioPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    audioPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  Widget slider() {
    return Slider(
        activeColor: pinkColor,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            seekToSecond(value.toInt());
            value = value;
          });
        });
  }

  void seekToSecond(int second) {
    if (!isPlaying) return;

    Duration newDuration = Duration(seconds: second);
    audioPlayer.seek(newDuration);
  }

  Widget playButton(String audioPath) {
    return Container(
        child: Center(
            child: IconButton(
                icon: Icon(
                  this.isPlaying != true ? Icons.play_arrow : Icons.pause,
                  size: 35.0,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    if (!this.isPlaying) {
                      audioCache.play(audioPath);
                      this.isPlaying = true;
                    } else {
                      audioPlayer.pause();
                      this.isPlaying = false;
                    }
                  });
                }),
        ));
  }

 Future<bool> _onBackPressed(){
    if(this.isPlaying)
    {
      audioPlayer.stop();
    }

    return new Future<bool>.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
          child: Scaffold(
        backgroundColor: blueColor,
        body: Column(
          children: <Widget>[
            Container(
              height: 500.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.image), fit: BoxFit.cover)),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [blueColor.withOpacity(0.4), blueColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Spacer(),
                        Text(widget.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 32.0)),
                        SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          widget.artist,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 18.0),
                        ),
                        SizedBox(height: 16.0),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 42.0),
         
            slider(),
           
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.fast_rewind,
                  color: Colors.white54,
                  size: 30.0,
                ),
                SizedBox(width: 32.0),
                playButton(widget.audioPath),
                SizedBox(width: 32.0),
                Icon(
                  Icons.fast_forward,
                  color: Colors.white54,
                  size: 30.0,
                )
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
