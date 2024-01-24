import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:valorizze/user_auth/firebase_auth_implementation/firebase_auth_services.dart';

class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPage();
}

class _SignPage extends State<SignPage> {
  bool showPassword = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

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
                'Cadastro sucedido! :)',
              ),
            ),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarSucess);
  }

  void _snackBarEmailAlreadInUse() {
    var snackBarSucess = const SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 2500),
        backgroundColor: Colors.redAccent,
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
                'Este email já está cadastrado!',
              ),
            ),
          ],
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBarSucess);
  }

  void _signUp(context) async {
    final FirebaseAuthService auth = FirebaseAuthService();
    // String username = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    setState(() {
      isLoading = true;
    });

    User? user = await auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      isLoading = false;
    });

    if (authError == 'email-already-in-use') {
      _snackBarEmailAlreadInUse();
    }

    if (user != null) {
      _snackBarSucess();
      Future.delayed(const Duration(milliseconds: 2000), () {
        Navigator.pushNamed(context, '/loginpage');
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffFFFBF5),
      body: Stack(
        children: [
          Column(
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
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Form(
                              key: _formKey,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
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
                                          vertical: 5),
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Preencha este campo!';
                                          }
                                          return null;
                                        },
                                        controller: _nameController,
                                        decoration: InputDecoration(
                                          hintText: 'Nome de Usuário',
                                          hintStyle: GoogleFonts.montserrat(
                                              color: Colors.grey),
                                          labelText: 'Nome de Usuário',
                                          labelStyle: GoogleFonts.montserrat(
                                              color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(0),
                                                bottomRight:
                                                    Radius.circular(10)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      textInputAction: TextInputAction.next,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Preencha este campo!';
                                        }
                                        return null;
                                      },
                                      controller: _emailController,
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
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: TextFormField(
                                        textInputAction: TextInputAction.next,
                                        obscureText: showPassword,
                                        controller: _passwordController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Preencha este campo!';
                                          } else if (value.length < 6) {
                                            return 'Sua senha deve conter no minímo 6 caracteres!';
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
                                                bottomRight:
                                                    Radius.circular(10)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      textInputAction: TextInputAction.done,
                                      obscureText: showPassword,
                                      validator: (value) {
                                        if (value != _passwordController.text) {
                                          return 'As senhas não coincidem!';
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
                                        hintText: 'Confirme sua senha',
                                        hintStyle: GoogleFonts.montserrat(
                                            color: Colors.grey),
                                        labelText: 'Confirme sua senha',
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
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: TapRegion(
                                        onTapInside: (event) => FocusManager
                                            .instance.primaryFocus
                                            ?.unfocus(),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _signUp(context);
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 38, 202, 43),
                                              minimumSize: const Size(150, 50),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(0),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                              ),
                                            ),
                                            child: isLoading
                                                ? const CircularProgressIndicator(
                                                    color: Colors.white,
                                                    strokeWidth: 2,
                                                  )
                                                : Text(
                                                    'Cadastrar',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            color: Colors.white,
                                                            fontSize: 16),
                                                  )),
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, '/loginpage');
                                        },
                                        child: Text(
                                          'Já é membro? Entre aqui!',
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromARGB(
                                                  255, 25, 115, 189)),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
