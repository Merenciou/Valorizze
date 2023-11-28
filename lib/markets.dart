import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';

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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Form(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Mercados',
                          hintStyle: GoogleFonts.montserrat(color: Colors.grey),
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
                      itemCount: 30,
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                    './lib/assets/images/tosta.png'),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      'Tosta Supermercados',
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
    );
  }
}
