import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

final TextEditingController emailLoginController = TextEditingController();
final TextEditingController passwordLoginController = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool finalAuth = false;
  bool showPassword = true;
  final _formKey = GlobalKey<FormState>();

  void _snackBarSucess() {
    const snackBarSucess = SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 1700),
        backgroundColor: Colors.green,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.verified,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'Seja bem vindo!',
              ),
            ),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarSucess);
  }

  void _snackBarEmailWrong() {
    const snackBarSucess = SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 3000),
        backgroundColor: Colors.red,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'Usuário não encontrado',
              ),
            ),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarSucess);
  }

  void _snackBarPasswordWrong() {
    const snackBarSucess = SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 3000),
        backgroundColor: Colors.red,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                'Senha incorreta!',
              ),
            ),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarSucess);
  }

  void loadCredencials(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final emailValue = prefs.getString('email') ?? '';
    final userName = prefs.getString('name') ?? '';
    final passwordValue = prefs.getString('password') ?? '';

    if (emailLoginController.text != emailValue &&
        emailLoginController.text != userName) {
      _snackBarEmailWrong();
    }

    if (passwordLoginController.text != passwordValue) {
      _snackBarPasswordWrong();
    }

    if (emailLoginController.text == emailValue &&
        passwordLoginController.text == passwordValue) {
      setState(() {
        finalAuth = true;
      });
    }

    if (emailLoginController.text == userName &&
        passwordLoginController.text == passwordValue) {
      setState(() {
        finalAuth = true;
      });
    }

    if (finalAuth == true) {
      _snackBarSucess();
      Future<void> sucessDelayed() async {
        await Future.delayed(const Duration(milliseconds: 2000), () {
          Navigator.of(context).pushNamed('/0');
        });
      }

      sucessDelayed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFBF5),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff9ADE7B),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(200)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Form(
                        child: Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Text(
                                      'Valorizze',
                                      style: GoogleFonts.alice(
                                          fontSize: 40,
                                          color: const Color(0xffF5F5DC)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: TextFormField(
                                      controller: emailLoginController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Preencha este campo!';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        hintStyle: GoogleFonts.montserrat(
                                            color: Colors.grey),
                                        labelText: 'Email',
                                        labelStyle: GoogleFonts.montserrat(
                                            color: Colors.grey),
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(0),
                                              bottomRight: Radius.circular(10)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 5),
                                    child: TextFormField(
                                      obscureText: showPassword,
                                      controller: passwordLoginController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Preencha este campo!';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                showPassword = !showPassword;
                                              });
                                            },
                                            icon: Icon(
                                              showPassword
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.grey,
                                            )),
                                        hintText: 'Senha',
                                        hintStyle: GoogleFonts.montserrat(
                                            color: Colors.grey),
                                        labelText: 'Senha',
                                        labelStyle: GoogleFonts.montserrat(
                                            color: Colors.grey),
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(0),
                                              bottomRight: Radius.circular(10)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        loadCredencials(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        minimumSize: const Size(150, 50),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(0),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Entrar',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 65, vertical: 10),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/signpage');
                                        },
                                        child: Text(
                                          'Ainda não é membro? Increva-se aqui',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  255, 25, 115, 189)),
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
