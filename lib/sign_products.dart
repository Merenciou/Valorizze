import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

void replaceSpaces() {
  final sampleText = productName.text;
  final textUnderscored = sampleText.replaceAll(' ', '_');
  productName.value = TextEditingValue(
      text: textUnderscored,
      selection: TextSelection.collapsed(offset: textUnderscored.length));
}

TextEditingController productName = TextEditingController();
TextEditingController productBarcode = TextEditingController();
TextEditingController productID = TextEditingController();
TextEditingController productPrice = TextEditingController();

void setProduct() {}

void storageProduct() async {
  final db = FirebaseFirestore.instance;

  final products = <String, dynamic>{
    'product_name': productName.text,
    'product_barcode': productBarcode.text,
    'product_ID': productID.text,
    'product_price': productPrice.text,
  };

  db.collection('products').add(products).then((DocumentReference doc) => null
      // print('dados enviados: ${doc.id}')
      );
  // DatabaseReference ref = FirebaseDatabase.instance.ref('/products');

  // await ref.child(productName.text).push().set({
  //   'product_name': productName.text,
  //   'product_barcode': productBarcode.text,
  //   'product_ID': productID.text,
  //   'product_price': productPrice.text,
  // });
}

void clearForms() {
  productName.clear();
  productBarcode.clear();
  productID.clear();
  productPrice.clear();
}

class SignProducts extends StatefulWidget {
  const SignProducts({Key? key}) : super(key: key);

  @override
  State<SignProducts> createState() => _SignProducts();
}

class _SignProducts extends State<SignProducts> {
  final _formKey = GlobalKey<FormState>();
  void snackSucess() {
    final snackbarSucess = SnackBar(
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 1700),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.add,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              'Produto cadastrado com sucesso!',
              style: GoogleFonts.montserrat(),
            ),
          )
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbarSucess);
  }

  @override
  void initState() {
    super.initState();
    productName.addListener(() {
      replaceSpaces();
    });
  }

  @override
  void dispose() {
    productName.dispose();
    super.dispose();
  }

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
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
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
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Preencha este campo!';
                            }
                            return null;
                          },
                          controller: productName,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Nome do Produto',
                            hintStyle:
                                GoogleFonts.montserrat(color: Colors.grey),
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
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Preencha este campo!';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            MaskTextInputFormatter(
                                mask: '############',
                                type: MaskAutoCompletionType.lazy)
                          ],
                          controller: productBarcode,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Código de Barras',
                            hintStyle:
                                GoogleFonts.montserrat(color: Colors.grey),
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
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Preencha este campo!';
                            }
                            return null;
                          },
                          controller: productID,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'ID',
                            hintStyle:
                                GoogleFonts.montserrat(color: Colors.grey),
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
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Preencha este campo!';
                            }
                            return null;
                          },
                          // inputFormatters: [
                          //   MaskTextInputFormatter(
                          //       mask: '######',
                          //       filter: {',': RegExp(r'[,]')},
                          //       type: MaskAutoCompletionType.lazy)
                          // ],
                          controller: productPrice,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Preço',
                            hintStyle:
                                GoogleFonts.montserrat(color: Colors.grey),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          storageProduct();
                          clearForms();
                          snackSucess();
                          replaceSpaces();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
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
                    onPressed: () {
                      clearForms();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: Text(
                      'Cancelar',
                      style: GoogleFonts.montserrat(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
