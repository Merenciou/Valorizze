import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valorizze/buy_list.dart';
import 'package:valorizze/item_preview.dart';
import 'package:valorizze/item_preview2.dart';
import 'package:valorizze/markets.dart';
import 'package:valorizze/homepage.dart';
import 'package:valorizze/login.dart';
import 'package:valorizze/offers.dart';
import 'package:valorizze/products2.dart';
import 'package:valorizze/search_list.dart';
import 'package:valorizze/services_app.dart';
import 'package:valorizze/setup_profile.dart';
import 'package:valorizze/sign.dart';
import 'package:valorizze/sign_products.dart';
import 'package:valorizze/testeindexoutra.dart';
import 'package:valorizze/update_prices.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  runApp(const MainApp());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await convertProduct();

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Color(0xff9ADE7B)));
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainApp();
}

class _MainApp extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
          color: const Color(0xffF7EFE5),
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/loginpage': (context) => const LoginPage(),
            '/signpage': (context) => const SignPage(),
            '/item_preview': (context) => const ItemPreview(),
            '/updateprices': (context) => const UpdatePrices(),
            '/signproducts': (context) => const SignProducts(),
            '/servicesapp': (context) => const ServicesApp(),
            '/searchlist': (context) => const SearchList(),
            '/buylist': (context) => const BuyList(),
            '/0': (context) => const Homepage(),
            '/1': (context) => const Markets(),
            '/2': (context) => const BuyList(),
            '/3': (context) => const SetupProfile(),
            '/testeindexoutra': (context) => const TesteIndexOutra(),
            '/offers': (context) => const Offers(),
          },
          home: const ItemPreview2()),
    );
  }
}
