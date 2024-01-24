import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorizze/homepage.dart';

class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _Offers();
}

class _Offers extends State<Offers> {
  bool isPressedFilter = false;
  bool isPressedCheckbox = false;
  List<bool> checkboxState =
      List.generate(dayOffersMarket.length, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF7EFE5),
        appBar: isPressedFilter
            ? null
            : AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: const Color(0xff9ADE7B),
                leading: const BackButton(color: Colors.white),
                title: Text(
                  'Ofertas do Dia',
                  style:
                      GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
                ),
              ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isPressedFilter = true;
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 30,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Filtrar',
                              style: GoogleFonts.montserrat(color: Colors.grey),
                            ),
                            PopupMenuButton(
                              color: Colors.red,
                              icon: const Icon(
                                Icons.filter_alt,
                                color: Colors.grey,
                                size: 15,
                              ),
                              onSelected: (String result) {
                                // print('$result selecionado');
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                  value: 'Item 1',
                                  child: Text(
                                    dayOffersMarket.toString(),
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Item 2',
                                  child: Text(
                                    dayOffersMarket.toString(),
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: 'Item 3',
                                  child: Text(
                                    dayOffersMarket.toString(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/item_preview');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                './lib/assets/images/${dayOffersImg[index]}.png',
                                width: 60,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dayOffersItems[index],
                                    style: GoogleFonts.montserrat(),
                                  ),
                                  Text(
                                    'R\$${dayOffersPrice[index]}',
                                    style: GoogleFonts.montserrat(
                                        color: const Color(0xff9ADE7B),
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              const Icon(
                                Icons.arrow_right,
                                color: Colors.grey,
                                size: 40,
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: dayOffersItems.length)
                ],
              ),
            ),
            if (isPressedFilter == true) screenFilter(context)
          ],
        ));
  }

  Widget screenFilter(context) {
    return Container(
      width: double.infinity,
      height: 600,
      color: const Color(0xffF7EFE5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            child: Text(
              'Filtros',
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 20, bottom: 10),
            child: Text(
              'Filtre por Mercados:',
              style: GoogleFonts.montserrat(color: Colors.grey),
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                    value: checkboxState[index],
                    title: Text(dayOffersMarket[index]),
                    secondary: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        child: Image.asset(
                            './lib/assets/images/${dayOffersMarketImg[index]}.png'),
                      ),
                    ),
                    tristate: false,
                    onChanged: (value) {
                      setState(() {
                        checkboxState[index] = !checkboxState[index];
                      });
                    });
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: dayOffersItems.length),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
                child: Text(
                  'Filtrar',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isPressedFilter = false;
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)))),
              child: Text(
                'Cancelar',
                style: GoogleFonts.montserrat(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
