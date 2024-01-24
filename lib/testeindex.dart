import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TesteIndex extends StatefulWidget {
  const TesteIndex({Key? key}) : super(key: key);

  @override
  State<TesteIndex> createState() => _TesteIndex();
}

var testeIndex = '0';

class _TesteIndex extends State<TesteIndex> {
  void setIndexValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      testeIndex = '2';
      prefs.setString('index', testeIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(testeIndex),
            ElevatedButton(
                onPressed: () {
                  setIndexValue();
                  Future.delayed(const Duration(milliseconds: 1500), () {
                    Navigator.pushNamed(context, '/testeindexoutra');
                  });
                },
                child: const Text('Navegar'))
          ],
        ),
      ),
    );
  }
}
