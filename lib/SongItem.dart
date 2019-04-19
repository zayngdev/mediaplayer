import 'DetailedScreen.dart';
import 'package:flutter/material.dart';

class SongItem extends StatelessWidget {
  final title;
  final artist;
  final image;

  SongItem(this.title, this.artist, this.image);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailedScreen(title, artist, image)));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                  child: Container(
                    height: 70,
                    width: 280,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.orangeAccent.withOpacity(0.1),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 60.0,
                                  width: 60.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.0),
                                    child: Image.asset(
                                      image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 60.0,
                                    width: 60.0,
                                    child: Icon(
                                      Icons.play_circle_filled,
                                      color: Colors.white.withOpacity(0.7),
                                      size: 42.0,
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  title,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                ),
                                SizedBox(height: 2.0),
                                Text(
                                  artist,
                                  style: TextStyle(
                                    color: Colors.black45.withOpacity(0.2),
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  child: Container(
                    width: 70,
                    height: 70,
                     decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.orangeAccent.withOpacity(0.1),
                      ),
                      child: Center(
                        child: Icon(Icons.add),

                      ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
