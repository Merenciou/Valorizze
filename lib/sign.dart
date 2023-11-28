import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPage();
}

const String emailValue = '';
const String passwordValue = '';

class _SignPage extends State<SignPage> {
  bool showPassword = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void setCredencials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', _emailController.text);
    await prefs.setString('password', _passwordController.text);
    await prefs.setString('name', _nameController.text);
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
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    'Valorizze',
                                    style: GoogleFonts.alice(
                                        fontSize: 40,
                                        color: const Color(0xffF5F5DC)),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: TextFormField(
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
                                            bottomRight: Radius.circular(10)),
                                      ),
                                    ),
                                  ),
                                ),
                                TextFormField(
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: TextFormField(
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
                                TextFormField(
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          setCredencials();
                                          Navigator.pushNamed(
                                              context, '/loginpage');
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 38, 202, 43),
                                        minimumSize: const Size(150, 50),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(0),
                                              bottomRight: Radius.circular(10)),
                                        ),
                                      ),
                                      child: Text(
                                        'Cadastrar',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white, fontSize: 16),
                                      )),
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
    );
  }
}
