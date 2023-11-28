import 'package:flutter/material.dart';
import 'package:flutter_application_1/buy_list.dart';
import 'package:flutter_application_1/item_preview.dart';
import 'package:flutter_application_1/markets.dart';
import 'package:flutter_application_1/offers.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/services_app.dart';
import 'package:flutter_application_1/setup_profile.dart';
import 'package:flutter_application_1/sign.dart';
import 'package:flutter_application_1/sign_products.dart';
import 'package:flutter_application_1/update_prices.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainApp();
}

class _MainApp extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/loginpage': (context) => const LoginPage(),
        '/signpage': (context) => const SignPage(),
        '/item_preview': (context) => const ItemPreview(),
        '/updateprices': (context) => const UpdatePrices(),
        '/signproducts': (context) => const SignProducts(),
        '/servicesapp': (context) => const ServicesApp(),
        '/0': (context) => const Offers(),
        '/1': (context) => const Markets(),
        '/2': (context) => const BuyList(),
        '/3': (context) => const SetupProfile(),
      },
      home: const Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
