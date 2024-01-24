import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:valorizze/item_preview.dart';

var productName = '';
var productBarcode = '';
var productId = '';
var productPrice = '';

Future<void> convertProduct() async {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final ref = db
      .collection("mercados")
      .doc("tosta_supermercados")
      .collection('produto')
      .doc('arroz_barao_5kg')
      .withConverter(
        fromFirestore: Products.fromFirestore,
        toFirestore: (Products products, _) => products.toFirestore(),
      );
  final docSnap = await ref.get();
  final product = docSnap.data();
  if (product != null) {
    productName = product.name.toString();
    productBarcode = product.barcode.toString();
    productId = product.id.toString();
    productPrice = product.price.toString();
  } else {
    print('Documento não encontrado');
  }
}

// Future<void> getProduct() async {
//   for (var i = 0; i < 10; i++) {
//     for (var i in product) {
//       final newProduct = Products();
//     }
//   }
// }

class Products {
  late final String? name;
  late final String? barcode;
  late final String? id;
  late final String? price;
  // late final String? imgUrl;

  Products({
    this.name,
    this.barcode,
    this.id,
    this.price,
    // this.imgUrl,
  });

  factory Products.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Products(
      name: data?['nome'],
      barcode: data?['codigo_barra'],
      id: data?['id'],
      price: data?['preco'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) 'name': name,
      if (barcode != null) 'barcode': barcode,
      if (id != null) 'id': id,
      if (price != null) 'price': price,
    };
  }
}
