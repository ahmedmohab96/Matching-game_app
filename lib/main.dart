import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text('Match the photo'),
        titleTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 30.0,
        ),
        backgroundColor: Colors.indigo[800],
      ),
      body: ImagePage(),
    ),
  ));
}

class ImagePage extends StatefulWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int LeftImageNumber = 1;
  int rightImageNumber = 2;

  void changeImage() {
    LeftImageNumber = Random().nextInt(8) + 1;
    rightImageNumber = Random().nextInt(8) + 1; //0:9
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          LeftImageNumber == rightImageNumber
              ? 'congratulation'
              : 'please try again',
          style: TextStyle(
            fontSize: 42.0,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      changeImage();
                    });
                  },
                  child: Image.asset('images/image-$LeftImageNumber.png'),
                ),
              ),
              Expanded(
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      changeImage();
                    });
                  },
                  child: Image.asset('images/image-$rightImageNumber.png'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
