import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesApp extends StatefulWidget {
  const ServicesApp({Key? key}) : super(key: key);

  @override
  State<ServicesApp> createState() => _ServicesApp();
}

class _ServicesApp extends State<ServicesApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7EFE5),
      appBar: AppBar(
        backgroundColor: const Color(0xff9ADE7B),
        leading: const BackButton(color: Colors.white),
        title: Text(
          'Serviços',
          style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
