import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Subscribe extends StatefulWidget {
  const Subscribe({Key key, String title}) : super(key: key);

  @override
  _SubscribeState createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const
      BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.yellow,
                blurRadius: 20, spreadRadius: 20
            )
          ]
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children :const [ Text("Subscribe", textScaleFactor: 1)]
    )
    );
  }
}
