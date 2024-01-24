import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';
import './products2.dart';

int indexValue = 0;
List<String> product = [];

class ItemPreview extends StatefulWidget {
  const ItemPreview({Key? key}) : super(key: key);

  @override
  State<ItemPreview> createState() => _ItemPreview();
}

class _ItemPreview extends State<ItemPreview> {
  bool isPressed = false;
  String priceValue = '-----';
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();

  void getIndex() async {
    final SharedPreferences refs = await SharedPreferences.getInstance();

    setState(() {
      indexValue = refs.getInt('index') ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    getIndex();
  }

  @override
  Widget build(BuildContext context) {
    final product = Products(
      name: productName,
      barcode: productBarcode,
      id: productId,
      price: productPrice,
    );

    return Scaffold(
      backgroundColor: const Color(0xffF7EFE5),
      appBar: AppBar(
        backgroundColor: const Color(0xffF7EFE5),
        automaticallyImplyLeading: false,
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black38,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.share,
                            color: Colors.black38,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/buylist');
                          },
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Colors.black38,
                          )),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 320,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Image.asset(
                  './lib/assets/images/${dayOffersImg[indexValue]}.png',
                  width: 200,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    dayOffersItems[indexValue],
                    style: GoogleFonts.montserrat(fontSize: 16),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 205,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(
                                color: Colors.yellow,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              child: Image.asset(
                                './lib/assets/images/${dayOffersMarketImg[indexValue]}.png',
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name.toString(),
                                // dayOffersMarket[indexValue],
                                style: GoogleFonts.montserrat(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: FutureBuilder(
                                  future: _fApp,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return const Text('Algum errro');
                                    } else if (snapshot.hasData) {
                                      return price();
                                    } else {
                                      return const Text(
                                          'Ops, há algum problema no preço!');
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isPressed = !isPressed;
                                // product = [
                                //   dayOffersItems[indexValue],
                                //   dayOffersImg[indexValue],
                                //   dayOffersPrice[indexValue],
                                // ];
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  isPressed ? Colors.green : Colors.amber,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.zero,
                                    topRight: Radius.zero,
                                    bottomLeft: Radius.zero,
                                    bottomRight: Radius.zero),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  isPressed ? Icons.remove : Icons.add,
                                  color: Colors.white,
                                ),
                                Text(
                                  isPressed
                                      ? 'Remover da lista de compras'
                                      : 'Adicionar à lista de compras',
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.zero,
                                        topRight: Radius.zero,
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                backgroundColor: Colors.blue),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.equalizer_rounded,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Comparar preço por mercado',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var value = '';

  Widget price() {
    // final DatabaseReference ref = FirebaseDatabase.instance
    //     .ref()
    //     .child('products')
    //     .child('feijão')
    //     .child('product_price');
    // ref.onValue.listen((event) {
    //   setState(() {
    //     priceValue = event.snapshot.value.toString();
    //   });
    // });

    return Text(
      'R\$ ${dayOffersPrice[indexValue]}',
      style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
    );
  }
}
