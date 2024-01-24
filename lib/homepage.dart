import 'package:flutter/material.dart';
import 'package:valorizze/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late int dayOffersIndex;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _Homepage();
}

List<String> categoriesImgs = [
  'acougue',
  'padaria',
  'farinaceos',
  'conservas',
  'bomboniere',
  'limpeza',
  'perfumaria',
  'bebidas',
];
List<String> categoriesItems = [
  'Açougue',
  'Padaria',
  'Farináceos',
  'Conservas',
  'Bomboniere',
  'Limpeza',
  'Perfumaria',
  'Bebidas',
];
List<String> dayOffersItems = [
  'ARROZ CRISTAL 5KG',
  'ARROZ CRISTAL 1KG',
  'FEIJÃO CRISTAL 1KG',
  'FEIJÃO DONA DÊ 1KG',
  'FLOCÃO SINHÁ 500G',
];
List<String> dayOffersImg = [
  'arroz_cristal_5kg',
  'arroz_cristal_1kg',
  'feijao_cristal_1kg',
  'feijao_dona_de_1kg',
  'flocao_sinha_500g',
];
List<String> dayOffersPrice = [
  '32,99',
  '23,99',
  '6,89',
  '5,49',
  '1,89',
];
List<String> dayOffersMarketImg = [
  'tosta',
  'mercadao_da_economia',
  'villefort',
  'bretas',
  'mercadao_da_economia',
];
List<String> dayOffersMarket = [
  'Tosta Supermercados',
  'Mercadão da Economia',
  'Villefort Atacarejo',
  'Bretas Atacarejo',
  'Mercadão da Economia',
];

class _Homepage extends State<Homepage> {
  void getProduct() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection('porducts')
        .where('product_name')
        .get()
        .then((snapshot) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF7EFE5),
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
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/searchlist');
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Text(
                                'O que procuras?',
                                style: GoogleFonts.montserrat(
                                    color: Colors.grey, fontSize: 16),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 14),
                              child: Icon(
                                Icons.search,
                                color: Color(0xff9ADE7B),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 800,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: SizedBox(
                              width: double.infinity,
                              height: 100,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: categoriesItems.length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(),
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
                                            Container(
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
                                                          Radius.circular(10))),
                                              width: 60,
                                              height: 60,
                                              child: Image.asset(
                                                './lib/assets/images/${categoriesImgs[index]}.png',
                                              ),
                                            ),
                                            Text(categoriesItems[index],
                                                style: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 320,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('OFERTAS DO DIA',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/offers');
                                        },
                                        child: Text(
                                          'Ver mais',
                                          style: GoogleFonts.montserrat(
                                              color: const Color(0xff9ADE7B)),
                                        ))
                                  ],
                                ),
                                Flexible(
                                  child: SizedBox(
                                    height: 280,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: dayOffersItems.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              const Divider(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () {
                                            void setIndex() async {
                                              final SharedPreferences refs =
                                                  await SharedPreferences
                                                      .getInstance();

                                              refs.setInt('index', index);
                                            }

                                            setIndex();
                                            Navigator.pushNamed(
                                                context, '/item_preview');
                                          },
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10,
                                                    bottom: 10,
                                                    right: 10),
                                                child: Material(
                                                  elevation: 1,
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            color:
                                                                Colors.white),
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 6,
                                                                  horizontal:
                                                                      6),
                                                          child: Container(
                                                            width: 106,
                                                            height: 150,
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        6,
                                                                    vertical:
                                                                        6),
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                                color: Color(
                                                                    0xffF7EFE5)),
                                                            child: SizedBox(
                                                              width: 50,
                                                              child:
                                                                  Image.asset(
                                                                './lib/assets/images/${dayOffersImg[index]}.png',
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 130,
                                                          decoration: const BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          10))),
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      0),
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
                                                                      child:
                                                                          Text(
                                                                        dayOffersItems[
                                                                            index],
                                                                        style: GoogleFonts.montserrat(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize: 12),
                                                                      )),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            4),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        Text(
                                                                          'R\$${dayOffersPrice[index]}',
                                                                          style:
                                                                              const TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color:
                                                                                Color(0xff9ADE7B),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              36,
                                                                          height:
                                                                              36,
                                                                          decoration: const BoxDecoration(
                                                                              color: Colors.yellow,
                                                                              borderRadius: BorderRadius.all(Radius.circular(50))),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                const BorderRadius.all(Radius.circular(100)),
                                                                            child:
                                                                                Image.asset(
                                                                              './lib/assets/images/${dayOffersMarketImg[index]}.png',
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
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 320,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('OFERTAS DA SEMANA',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600)),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Ver mais',
                                          style: GoogleFonts.montserrat(
                                              color: const Color(0xff9ADE7B)),
                                        ))
                                  ],
                                ),
                                Flexible(
                                  child: SizedBox(
                                    height: 280,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: dayOffersItems.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              const Divider(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 10,
                                                  right: 10),
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
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            color:
                                                                Colors.white),
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 6,
                                                                  horizontal:
                                                                      6),
                                                          child: Container(
                                                            width: 110,
                                                            height: 150,
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        6,
                                                                    vertical:
                                                                        6),
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                                color: Color(
                                                                    0xffF7EFE5)),
                                                            child: Image.asset(
                                                                './lib/assets/images/${dayOffersImg[index]}.png'),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 130,
                                                          decoration: const BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          15))),
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      0),
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
                                                                      child:
                                                                          Text(
                                                                        dayOffersItems[
                                                                            index],
                                                                        style: GoogleFonts.montserrat(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize: 12),
                                                                      )),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        bottom:
                                                                            4),
                                                                    child: Text(
                                                                      'R\$${dayOffersPrice[index]}',
                                                                      style:
                                                                          const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w500,
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
      ),
    );
  }
}
