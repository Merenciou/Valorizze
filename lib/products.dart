import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// String productName = '';

// Future<void> getProductName() async {
//   final FirebaseFirestore db = FirebaseFirestore.instance;
//   final docRef = db.collection('mercados').doc('tosta_supermercados').;
//   docRef.get().then((DocumentSnapshot doc) {
//     if (doc.exists) {
//       final data = doc.data() as Map<String, dynamic>;
//       productName = data.toString();
//       print(productName);
//     } else {
//       print('Documento não encontrado');
//     }
//   }, onError: (e) => print('Há algum erro: $e'));
// }

class ProductName extends Text {
  ProductName(
      {Key? key,
      String productName = 'Arroz Villefort 5kg',
      TextStyle? productNameStyle})
      : super(
            key: key,
            productName,
            style: productNameStyle ??
                GoogleFonts.montserrat(color: Colors.grey, fontSize: 14));
}

class ProductImage extends StatefulWidget {
  final String productImagePath;

  const ProductImage(
      {Key? key,
      this.productImagePath = './lib/assets/images/arroz_cristal_1kg.png'})
      : super(key: key);

  @override
  State<ProductImage> createState() => _ProductImage();
}

class _ProductImage extends State<ProductImage> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(widget.productImagePath);
  }
}

class ProductPrice extends Text {
  const ProductPrice({super.key, String productPrice = 'R\$32,99'})
      : super(productPrice);
}
