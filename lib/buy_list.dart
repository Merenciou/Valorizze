import 'package:flutter/material.dart';
import 'package:valorizze/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorizze/homepage.dart';
import 'package:valorizze/products.dart';

class BuyList extends StatefulWidget {
  const BuyList({Key? key}) : super(key: key);

  @override
  State<BuyList> createState() => _BuyList();
}

class _BuyList extends State<BuyList> {
  bool dragged = false;
  List<bool> checkboxPressed =
      List.generate(dayOffersItems.length, (index) => false);
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
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Lista de Compras',
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    child: Column(
                      children: [
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: dayOffersItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: CheckboxListTile(
                                value: checkboxPressed[index],
                                onChanged: (value) {
                                  setState(() {
                                    checkboxPressed[index] =
                                        !checkboxPressed[index];
                                  });
                                },
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: ProductImage(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ProductName(),
                                          Text(
                                            'R\$${dayOffersPrice[index]}',
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Icon(
                                      Icons.delete,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                              // child: ListTile(
                              //   tileColor: longPressed
                              //       ? const Color(0xffFF8080)
                              //       : const Color(0xffF7EFE5),
                              //   leading: Row(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       Padding(
                              //         padding: const EdgeInsets.symmetric(
                              //             horizontal: 4),
                              //         child: GestureDetector(
                              //           onHorizontalDragDown: (detail) {
                              //             setState(() {
                              //               dragged = !dragged;
                              //             });
                              //             print(dragged);
                              //           },
                              //           // onHorizontalDragCancel: () {
                              //           //   print('cancelou');
                              //           // },
                              //           child:
                              //           Checkbox(
                              //               value: checkboxPressed,
                              //               onChanged: (bool? value) {
                              //                 setState(() {
                              //                   checkboxPressed =
                              //                       !checkboxPressed;
                              //                 });
                              //               }),
                              //         ),
                              //       ),
                              //       Image.asset(
                              //           './lib/assets/images/${dayOffersImg[index]}.png'),
                              //     ],
                              //   ),
                              //   title: Text(
                              //     dayOffersItems[index],
                              //     style: GoogleFonts.montserrat(fontSize: 12),
                              //   ),
                              //   subtitle: Text(
                              //     'R\$39,90',
                              //     style: GoogleFonts.montserrat(
                              //         fontWeight: FontWeight.w600),
                              //   ),
                              //   trailing: IconButton(
                              //       onPressed: () {},
                              //       icon: const Icon(
                              //         Icons.delete,
                              //         color: Colors.grey,
                              //       )),
                              // ),
                            );
                            // return Container(
                            //   margin: const EdgeInsets.only(bottom: 10),
                            //   decoration: const BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(15))),
                            //   child: CheckboxListTile(
                            //     value: checkboxPressed[index],
                            //     onChanged: (value) {
                            //       setState(() {
                            //         checkboxPressed[index] =
                            //             !checkboxPressed[index];
                            //       });
                            //     },
                            //     controlAffinity:
                            //         ListTileControlAffinity.leading,
                            //     title: Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceEvenly,
                            //       children: [
                            //         SizedBox(
                            //           width: 50,
                            //           height: 50,
                            //           child: Image.asset(
                            //               './lib/assets/images/${dayOffersImg[index]}.png'),
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.symmetric(
                            //               horizontal: 16),
                            //           child: Column(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.center,
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: [
                            //               Text(
                            //                 dayOffersItems[index],
                            //                 style: GoogleFonts.montserrat(
                            //                     color: Colors.grey,
                            //                     fontSize: 14),
                            //               ),
                            //               Text(
                            //                 'R\$${dayOffersPrice[index]}',
                            //                 style: GoogleFonts.montserrat(
                            //                     fontWeight: FontWeight.w500,
                            //                     fontSize: 13),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //         const Icon(
                            //           Icons.delete,
                            //           color: Colors.grey,
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            //   // child: ListTile(
                            //   //   tileColor: longPressed
                            //   //       ? const Color(0xffFF8080)
                            //   //       : const Color(0xffF7EFE5),
                            //   //   leading: Row(
                            //   //     mainAxisSize: MainAxisSize.min,
                            //   //     children: [
                            //   //       Padding(
                            //   //         padding: const EdgeInsets.symmetric(
                            //   //             horizontal: 4),
                            //   //         child: GestureDetector(
                            //   //           onHorizontalDragDown: (detail) {
                            //   //             setState(() {
                            //   //               dragged = !dragged;
                            //   //             });
                            //   //             print(dragged);
                            //   //           },
                            //   //           // onHorizontalDragCancel: () {
                            //   //           //   print('cancelou');
                            //   //           // },
                            //   //           child:
                            //   //           Checkbox(
                            //   //               value: checkboxPressed,
                            //   //               onChanged: (bool? value) {
                            //   //                 setState(() {
                            //   //                   checkboxPressed =
                            //   //                       !checkboxPressed;
                            //   //                 });
                            //   //               }),
                            //   //         ),
                            //   //       ),
                            //   //       Image.asset(
                            //   //           './lib/assets/images/${dayOffersImg[index]}.png'),
                            //   //     ],
                            //   //   ),
                            //   //   title: Text(
                            //   //     dayOffersItems[index],
                            //   //     style: GoogleFonts.montserrat(fontSize: 12),
                            //   //   ),
                            //   //   subtitle: Text(
                            //   //     'R\$39,90',
                            //   //     style: GoogleFonts.montserrat(
                            //   //         fontWeight: FontWeight.w600),
                            //   //   ),
                            //   //   trailing: IconButton(
                            //   //       onPressed: () {},
                            //   //       icon: const Icon(
                            //   //         Icons.delete,
                            //   //         color: Colors.grey,
                            //   //       )),
                            //   // ),
                            // );
                          },
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Limpar Lista de Compras',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          )
                        ],
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
