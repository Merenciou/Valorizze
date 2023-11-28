import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavbarCustom extends StatefulWidget {
  const BottomNavbarCustom({Key? key}) : super(key: key);

  @override
  State<BottomNavbarCustom> createState() => _BottomNavbarCustom();
}

class _BottomNavbarCustom extends State<BottomNavbarCustom> {
  int _currentIndexBottomBar = 0;
  void bottomNavbarChanges(i) {
    setState(() {
      _currentIndexBottomBar = i;

      switch (_currentIndexBottomBar) {
        case 0:
          _currentIndexBottomBar = 0;
        case 1:
          _currentIndexBottomBar = 1;
        case 2:
          _currentIndexBottomBar = 2;
        case 3:
          _currentIndexBottomBar = 3;
        case 4:
          _currentIndexBottomBar = 4;
          break;
      }
    });
    Navigator.pushNamed(context, '/$_currentIndexBottomBar');
  }

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      itemPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      backgroundColor: Colors.white,
      currentIndex: _currentIndexBottomBar,
      onTap: bottomNavbarChanges,
      items: [
        SalomonBottomBarItem(
          selectedColor: Colors.white,
          icon: const Icon(
            Icons.search,
            color: Color(0xff9ADE7B),
          ),
          title: Text(
            'OFERTAS',
            style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 12),
          ),
        ),
        SalomonBottomBarItem(
          selectedColor: Colors.white,
          icon: const Icon(
            Icons.store,
            color: Color(0xff9ADE7B),
          ),
          title: Text(
            'MERCADOS',
            style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 12),
          ),
        ),
        SalomonBottomBarItem(
          selectedColor: Colors.white,
          icon: const Icon(
            Icons.shopping_cart,
            color: Color(0xff9ADE7B),
          ),
          title: Text(
            'CARRINHO',
            style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 12),
          ),
        ),
        // SalomonBottomBarItem(
        //   selectedColor: Colors.white,
        //   icon: const Icon(
        //     Icons.find_replace,
        //     color: Color(0xff9ADE7B),
        //   ),
        //   title: Text(
        //     'COMPARAR',
        //     style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 12),
        //   ),
        // ),
        SalomonBottomBarItem(
          selectedColor: Colors.white,
          icon: const Icon(
            Icons.person,
            color: Color(0xff9ADE7B),
          ),
          title: Text(
            'PERFIL',
            style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 12),
          ),
        ),
      ],
    );
  }
}
