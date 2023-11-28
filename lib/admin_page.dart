import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _Categories();
}

class _Categories extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7EFE5),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Administrativo',
                  style: GoogleFonts.montserrat(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/updateprices');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Text(
                        'Atualização de Preços',
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signproducts');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        child: Text(
                          'Cadastrar Produto',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/servicesapp');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        child: Text(
                          'Serviços',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        child: Text(
                          'Gerenciamento de Usuários',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
