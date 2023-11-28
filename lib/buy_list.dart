import 'package:flutter/material.dart';
import 'package:valorizze/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class BuyList extends StatefulWidget {
  const BuyList({Key? key}) : super(key: key);

  @override
  State<BuyList> createState() => _BuyList();
}

class _BuyList extends State<BuyList> {
  bool checkboxPressed = false;
  bool longPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavbarCustom(),
      backgroundColor: const Color(0xffF7EFE5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Lista de Compras',
                    style: GoogleFonts.montserrat(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 550,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onLongPress: () {
                                  setState(() {
                                    longPressed = true;
                                  });
                                },
                                onLongPressEnd: (detail) {
                                  setState(() {
                                    longPressed = false;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: ListTile(
                                    tileColor: longPressed
                                        ? const Color(0xffFF8080)
                                        : const Color(0xffF7EFE5),
                                    leading: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: Checkbox(
                                              value: checkboxPressed,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  checkboxPressed =
                                                      !checkboxPressed;
                                                });
                                              }),
                                        ),
                                        Image.asset(
                                            './lib/assets/images/meat2.png'),
                                      ],
                                    ),
                                    title: Text(
                                      'Coxão Mole Kg',
                                      style:
                                          GoogleFonts.montserrat(fontSize: 12),
                                    ),
                                    subtitle: Text(
                                      'R\$39,90',
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    trailing: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.delete)),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                      height: 200,
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'mercados:',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Supermercado Tosta',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Supermercado Jataí',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: Container(
                                height: 1.0,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'total:',
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'R\$400,00',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
