import 'package:flutter/material.dart';
import 'package:valorizze/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:valorizze/homepage.dart';

class Markets extends StatefulWidget {
  const Markets({Key? key}) : super(key: key);

  @override
  State<Markets> createState() => _Markets();
}

class _Markets extends State<Markets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEBE3D5),
      bottomNavigationBar: const BottomNavbarCustom(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            color: const Color(0xffEBE3D5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Form(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Mercados',
                            hintStyle:
                                GoogleFonts.montserrat(color: Colors.grey),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: Color(0xff9ADE7B),
                                )),
                            filled: true,
                            fillColor: Colors.white,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 700,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: dayOffersMarket.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50)),
                                        child: Image.asset(
                                            './lib/assets/images/${dayOffersMarketImg[index]}.png'),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(
                                        dayOffersMarket[index],
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Text('Rua Itarumã, 197, Jataí - GO',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 11, color: Colors.grey)),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_right,
                                      color: Colors.grey,
                                      size: 40,
                                    ))
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
