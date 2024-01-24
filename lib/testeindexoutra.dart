import 'package:flutter/material.dart';

class TesteIndexOutra extends StatefulWidget {
  const TesteIndexOutra({Key? key}) : super(key: key);

  @override
  State<TesteIndexOutra> createState() => _TesteIndexOutra();
}

class _TesteIndexOutra extends State<TesteIndexOutra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.red,
            ),
          ),
          Positioned(
            top: 40,
            left: 40,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
          ),
          Positioned(
            top: 30,
            left: 30,
            child: Container(
              width: 50,
              height: 50,
              color: Colors.yellow,
            ),
          ),
        ],
      )),
    );
  }
}
