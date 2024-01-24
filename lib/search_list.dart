import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String nameValue = '------';

Future<void> queryData() async {
  // final db = FirebaseFirestore.instance.collection('mercados');
  // db.
  // DatabaseReference productsRef = FirebaseDatabase.instance.ref('products');
  // productsRef.once().then((DatabaseEvent event) {});
}

class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  State<SearchList> createState() => _SearchList();
}

class _SearchList extends State<SearchList> {
  TextEditingController searchController = TextEditingController();
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  late FocusNode _focusNode;
  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7EFE5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  autofocus: true,
                  controller: searchController,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Exemplo: Arroz, Feijão...',
                      labelStyle: GoogleFonts.montserrat(color: Colors.grey),
                      prefixIcon: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.grey,
                          )),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: IconButton(
                            onPressed: () {
                              searchController.clear();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.grey,
                            )),
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
            ),
            FutureBuilder(
              future: _fApp,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Produto não encontrado!');
                } else if (snapshot.hasData) {
                  return suggestionBox();
                } else {
                  return const Text('Ops, há algum problema');
                }
              },
            ),
            const ElevatedButton(onPressed: queryData, child: Text('data'))
          ],
        ),
      ),
    );
  }

  Widget suggestionBox() {
    final DatabaseReference ref = FirebaseDatabase.instance
        .ref()
        .child('products')
        .child('arroz_cristal_5kg')
        .child('-NkqL7Xwt4I7P-7BQftm')
        .child('product_name');
    ref.onValue.listen((event) {
      setState(() {
        nameValue = event.snapshot.value.toString();
      });
    });
    return Text(nameValue);
    // return Padding(
    //   padding: const EdgeInsets.only(top: 10),
    //   child: Container(
    //     width: double.infinity,
    //     height: 100,
    //     color: Colors.white,
    //     child: Text(nameValue),
    //   ),
    // );
  }
}
