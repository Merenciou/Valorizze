import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:valorizze/user_auth/firebase_auth_implementation/firebase_auth_services.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

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
    var snackBarSucess = const SnackBar(
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
    var snackBarSucess = const SnackBar(
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
                'Digite corretamente o seu email',
              ),
            ),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarSucess);
  }

  void _snackBarPasswordWrong() {
    var snackBarSucess = const SnackBar(
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
                'Email ou senha incorreto!',
              ),
            ),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarSucess);
  }

  void _signIn(context) async {
    final FirebaseAuthService auth = FirebaseAuthService();
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      _snackBarSucess();
      Future.delayed(const Duration(milliseconds: 1800), () {
        Navigator.pushNamed(context, '/0');
      });
    } else if (authError == 'invalid-email') {
      _snackBarEmailWrong();
    } else if (authError == 'invalid-credential') {
      _snackBarPasswordWrong();
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
                                          fontSize: 40, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: TextFormField(
                                      textInputAction: TextInputAction.next,
                                      controller: _emailController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Preencha este campo!';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Email ou Nome de Usuário',
                                        hintStyle: GoogleFonts.montserrat(
                                            color: Colors.grey),
                                        labelText: 'Email ou Nome de Usuário',
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
                                      textInputAction: TextInputAction.done,
                                      obscureText: showPassword,
                                      controller: _passwordController,
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
                                        _signIn(context);
                                        // loadCredencials(context);
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
