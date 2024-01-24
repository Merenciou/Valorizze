import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

// Future<List<DocumentSnapshot>> getData() async {
//   final FirebaseFirestore db = FirebaseFirestore.instance;
//   QuerySnapshot querySnapshot = await db
//       .collection('mercados')
//       .doc('tosta_supermercados')
//       .collection('produto')
//       .get();
//   return querySnapshot.docs;
// }

String urlImage = '';

Future<void> getUrlImage() async {
  final storageRef = FirebaseStorage.instance.ref().child('produto_imagem');

  // final imageRef = storageRef.child('produto_imagem');

  final appDocDir = await getApplicationDocumentsDirectory();

  final filePath = '${appDocDir.absolute}/produto_imagem/arroz_cristal_5kg.png';

  final file = File(filePath);

  final downloadTask = storageRef.writeToFile(file);
  downloadTask.snapshotEvents.listen((taskSnapshot) {
    switch (taskSnapshot.state) {
      case TaskState.running:
        print('Rodando');
        break;
      case TaskState.paused:
        print('Em pausa');
        break;
      case TaskState.success:
        print('Sucedido');
        break;
      case TaskState.canceled:
        print('Cancelado');
        break;
      case TaskState.error:
        print('Algum errooo');
        break;
    }
  });
}

// Future<String> getUrlImage() async {
//   final storageRef = FirebaseStorage.instance.ref();

//   final imageUrl = await storageRef
//       .child('produto_imagem/arroz_cristal_5kg.png')
//       .getDownloadURL();

//   print('aaaaaa imagem: $imageUrl');
//   urlImage = imageUrl;

//   return urlImage.toString();
// }

class ItemPreview2 extends StatefulWidget {
  const ItemPreview2({Key? key}) : super(key: key);

  @override
  State<ItemPreview2> createState() => _ItemPreview2();
}

class _ItemPreview2 extends State<ItemPreview2> {
  @override
  void initState() {
    super.initState();
    // getData();
    getUrlImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // FutureBuilder(
          //     future: getData(),
          //     builder: (BuildContext context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const CircularProgressIndicator();
          //       } else if (snapshot.hasError) {
          //         return Text('Algum erro ${snapshot.error}');
          //       } else {
          //         return Container(
          //           width: 300,
          //           height: 200,
          //           color: Colors.yellow,
          //           child: ListView.builder(
          //             shrinkWrap: true,
          //             itemCount: snapshot.data!.length,
          //             itemBuilder: (BuildContext context, int index) {
          //               DocumentSnapshot document = snapshot.data![index];
          //               Map<String, dynamic> data =
          //                   document.data() as Map<String, dynamic>;
          //               return Text(data['nome']);
          //             },
          //           ),
          //         );
          //       }
          //     }),
          FutureBuilder(
              future: getUrlImage(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('Erro ao carregar imagem');
                } else {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(urlImage.toString());
                      });
                }
              })
        ],
      ),
    );
  }
}
