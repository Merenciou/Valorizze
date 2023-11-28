import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemPreview extends StatefulWidget {
  const ItemPreview({Key? key}) : super(key: key);

  @override
  State<ItemPreview> createState() => _ItemPreview();
}

class _ItemPreview extends State<ItemPreview> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
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
                          onPressed: () {},
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
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Image.asset(
                    './lib/assets/images/meat2.png',
                    width: 300,
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                  child: Text(
                    'Coxão Mole Kg',
                    style: GoogleFonts.montserrat(fontSize: 16),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 190,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('./lib/assets/images/tosta.png'),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  'Tosta Supermercados',
                                  style: GoogleFonts.montserrat(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Flexible(
                                  child: SizedBox(
                                    width: 150,
                                    child: Text(
                                      'R\$39,90',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: GestureDetector(
                        onTapDown: (details) {
                          setState(() {
                            isPressed = !isPressed;
                          });
                        },
                        child: ElevatedButton(
                          onPressed: () {},
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
                                style:
                                    GoogleFonts.montserrat(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
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
}
