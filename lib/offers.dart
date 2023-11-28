import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom_navbar.dart';
import 'package:flutter_application_1/search_page.dart';

import 'package:google_fonts/google_fonts.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _Offers();
}

class _Offers extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavbarCustom(),
      body: Container(
        color: const Color(0xffF7EFE5),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  SizedBox(
                    height: 800,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Form(
                          child: SearchPage(),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 100,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 10),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {},
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Material(
                                              elevation: 1,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.black12,
                                                          offset: Offset(1, 1),
                                                          blurRadius: 1)
                                                    ],
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                width: 60,
                                                height: 60,
                                                child: Image.asset(
                                                    './lib/assets/images/meat.jpg'),
                                              ),
                                            ),
                                            Text('FRIOS',
                                                style: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(),
                                itemCount: 10),
                          ),
                        ),
                        SizedBox(
                          height: 270,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('OFERTAS DO DIA',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              Flexible(
                                child: SizedBox(
                                  height: 280,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: 10,
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const Divider(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10, right: 10),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/item_preview');
                                              },
                                              child: Material(
                                                elevation: 1,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          color: Colors.white),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 6,
                                                                horizontal: 6),
                                                        child: Container(
                                                          width: 110,
                                                          height: 150,
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 6,
                                                                  vertical: 6),
                                                          decoration: const BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10)),
                                                              color: Color(
                                                                  0xffF7EFE5)),
                                                          child: Image.asset(
                                                              './lib/assets/images/meat2.png'),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 130,
                                                        decoration: const BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10))),
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        4),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            6),
                                                                    child: Text(
                                                                      'COXÃO MOLE KG',
                                                                      style: GoogleFonts.montserrat(
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          fontSize:
                                                                              12),
                                                                    )),
                                                                const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              4),
                                                                  child: Text(
                                                                    'R\$39,90',
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Color(
                                                                          0xff9ADE7B),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 280,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('OFERTAS DA SEMANA',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              Flexible(
                                child: SizedBox(
                                  height: 280,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: 10,
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const Divider(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, bottom: 10, right: 10),
                                            child: InkWell(
                                              onTap: () {},
                                              child: Material(
                                                elevation: 1,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          color: Colors.white),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical: 6,
                                                                horizontal: 6),
                                                        child: Container(
                                                          width: 110,
                                                          height: 150,
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 6,
                                                                  vertical: 6),
                                                          decoration: const BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10)),
                                                              color: Color(
                                                                  0xffF7EFE5)),
                                                          child: Image.asset(
                                                              './lib/assets/images/fish.png'),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 130,
                                                        decoration: const BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            15))),
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        4),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            6),
                                                                    child: Text(
                                                                      'PEIXE TAMBAQUI KG',
                                                                      style: GoogleFonts.montserrat(
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          fontSize:
                                                                              12),
                                                                    )),
                                                                const Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              4),
                                                                  child: Text(
                                                                    'R\$29,90',
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Color(
                                                                          0xff9ADE7B),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
