import 'package:flutter/material.dart';
import 'package:valorizze/buy_list.dart';
import 'package:valorizze/item_preview.dart';
import 'package:valorizze/markets.dart';
import 'package:valorizze/offers.dart';
import 'package:valorizze/login.dart';
import 'package:valorizze/services_app.dart';
import 'package:valorizze/setup_profile.dart';
import 'package:valorizze/sign.dart';
import 'package:valorizze/sign_products.dart';
import 'package:valorizze/update_prices.dart';

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
