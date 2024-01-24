import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('products')
            .where('product_name', isEqualTo: query)
            .snapshots(),
        builder: (context, snapshot) {
          List<Column> productWidgets = [];

          if (snapshot.hasData) {
            final products = snapshot.data?.docs.toList();
            for (var product in products!) {
              final productWidget = Column(
                children: [
                  Text(
                    product['product_name'],
                    style: GoogleFonts.montserrat(fontSize: 20),
                  )
                ],
              );
              productWidgets.add(productWidget);
            }
          }
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    color: Colors.grey,
                    child: ListView.separated(
                      itemCount: productWidgets.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: productWidgets,
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      // children: productWidgets,
                    ),
                  ),
                ),
              ),
            ],
          );
        });

    // return FutureBuilder(
    //   future: produto,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       return ListView.builder(
    //         itemCount: snapshot.data?.docs.length,
    //         itemBuilder: (context, index) {
    //           final productDoc = snapshot.data?.docs[index];
    //           final product = productDoc.data();

    //           return Text(product['product_name']);
    //         },
    //       );
    //     } else {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //   },
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Sugestões'));
  }
}
