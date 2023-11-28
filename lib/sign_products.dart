import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignProducts extends StatefulWidget {
  const SignProducts({Key? key}) : super(key: key);

  @override
  State<SignProducts> createState() => _SignProducts();
}

class _SignProducts extends State<SignProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7EFE5),
      appBar: AppBar(
        backgroundColor: const Color(0xff9ADE7B),
        leading: const BackButton(color: Colors.white),
        title: Text(
          'Cadastrar Produtos',
          style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_photo_alternate,
                            color: Colors.grey,
                            size: 80,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Nome do Produto',
                        hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Código de Barras',
                        hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'ID',
                        hintStyle: GoogleFonts.montserrat(color: Colors.grey),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  child: Text(
                    'Cadastrar',
                    style: GoogleFonts.montserrat(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                child: Text(
                  'Cancelar',
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
