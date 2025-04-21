import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text("تطابق صوره"),
        backgroundColor: Colors.indigo[800],
      ),
      body: ImagePage(), // استدعاء الكلاس الصحيح
    ),
  ));
}

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImageNumber = 9; // تعريف متغير الصورة هنا
  int rightImageNumber = 2;

  void changeimage() {
    rightImageNumber = Random().nextInt(8) + 1;
    leftImageNumber = Random().nextInt(8) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImageNumber == rightImageNumber
              ? "Congratulations, you have succeeded."
              : "please try again",
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      changeimage();
                      // (leftImageNumber % 5) + 1; // تغيير الصورة عند الضغط
                    });
                  },
                  splashColor: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('images/image-$leftImageNumber.png'),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      changeimage();
                    });
                    // (leftImageNumber % 5) + 1; // تغيير الصورة عند الضغط
                  },
                  splashColor: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('images/image-$rightImageNumber.png'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
