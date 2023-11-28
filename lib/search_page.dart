import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
        viewElevation: 0,
        viewSurfaceTintColor: Colors.white,
        viewBackgroundColor: Colors.white,
        dividerColor: const Color(0xff9ADE7B),
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            hintText: 'O que procuras?',
            hintStyle: MaterialStateProperty.all(
                GoogleFonts.montserrat(color: Colors.grey)),
            overlayColor: MaterialStateProperty.all(Colors.white),
            surfaceTintColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color(0xff9ADE7B);
              }
              return Colors.white;
            }),
            controller: controller,
            padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0)),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            leading: const Icon(
              Icons.search,
              color: Color(0xff9ADE7B),
            ),
          );
        },
        suggestionsBuilder:
            (BuildContext context, SearchController controller) {
          return List<ListTile>.generate(10, (int index) {
            final String item = 'Coxão Mole Kg $index';
            return ListTile(
              tileColor: Colors.white,
              hoverColor: const Color(0xff9ADE7B),
              title: Text(item),
              onTap: () {
                setState(() {
                  controller.closeView(item);
                });
              },
            );
          });
        });
  }
}
