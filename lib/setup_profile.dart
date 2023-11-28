import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottom_navbar.dart';

import 'package:google_fonts/google_fonts.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({Key? key}) : super(key: key);

  @override
  State<SetupProfile> createState() => _SetupProfile();
}

class _SetupProfile extends State<SetupProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavbarCustom(),
      backgroundColor: const Color(0xffF7EFE5),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: CircleAvatar(
                  backgroundColor: const Color(0xffF7EFE5),
                  radius: 50,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person,
                      color: Color(0xff9ADE7B),
                      size: 80,
                    ),
                  ),
                ),
              ),
              Text(
                'Vitor Merencio',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
              ),
              Text(
                'vitormerencio.1987@gmail.com',
                style: GoogleFonts.montserrat(fontSize: 12),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.yellow,
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        'Faça sua assinatura conosco! Confira aqui nossos benefícios',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: const Color(0xffF7EFE5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Dados Pessoais',
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Editar email',
                              style: GoogleFonts.montserrat(color: Colors.grey),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Icon(
                              Icons.edit,
                              size: 20,
                              color: Color(0xff9ADE7B),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Editar senha',
                                style:
                                    GoogleFonts.montserrat(color: Colors.grey),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: Icon(
                                Icons.edit,
                                size: 20,
                                color: Color(0xff9ADE7B),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Contato',
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Mensagens',
                              style: GoogleFonts.montserrat(color: Colors.grey),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Icon(
                              Icons.email,
                              size: 20,
                              color: Color(0xff9ADE7B),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Algum problema? Fale conosco',
                                style:
                                    GoogleFonts.montserrat(color: Colors.grey),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6),
                              child: Icon(
                                Icons.message,
                                size: 20,
                                color: Color(0xff9ADE7B),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Avalie-nos',
                                style:
                                    GoogleFonts.montserrat(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Política de Privacidade',
                                style:
                                    GoogleFonts.montserrat(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Informativo',
                                style:
                                    GoogleFonts.montserrat(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          surfaceTintColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Excluir conta'),
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            surfaceTintColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)))),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Sair da conta'),
                            Icon(
                              Icons.logout,
                              color: Colors.red,
                              size: 20,
                            )
                          ],
                        ))
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
