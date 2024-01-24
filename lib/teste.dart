// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:valorizze/search_page.dart';

// class Teste extends StatefulWidget {
//   const Teste({Key? key}) : super(key: key);

//   @override
//   State<Teste> createState() => _Teste();
// }

// class _Teste extends State<Teste> {
//   // String valueTeste = '------';

//   // Future<void> readData() async {
//   //   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   //   await firestore.collection('products').get().then((value) {
//   //     for (var produto in value.docs) {
//   //       setState(() {
//   //         valueTeste = produto.data().toString();
//   //       });
//   //       // print('valor: ${produto.data()}');
//   //       // print(valueTeste);
//   //     }
//   //   });
//   // }

//   // void addData() async {
//   //   for (var element in data) {}
//   // }

//   // List<Map<String, dynamic>> data = [{}];
//   // String nome = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: TextFormField(
//                 onChanged: (value) {
//                   // setState(() {
//                   //   nome = value;
//                   // });
//                 },
//                 decoration: const InputDecoration(
//                     filled: true,
//                     fillColor: Colors.lightBlue,
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)))),
//               ),
//             ),
//             StreamBuilder(
//                 stream: FirebaseFirestore.instance
//                     .collection('mercados')
//                     .snapshots(),
//                 builder: (BuildContext context,
//                     AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (snapshot.hasError) return Text('erro: ${snapshot.error}');
//                   switch (snapshot.connectionState) {
//                     case ConnectionState.waiting:
//                       return const Text('Carregando...');
//                     case ConnectionState.active:
//                       return createListView(context, snapshot);
//                     case ConnectionState.none:
//                       return const Text('Nenhum dado encontrado');
//                     default:
//                       return const Text('Caso padrão');
//                   }
//                 }),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//               child: const Text('Buscar'),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget createListView(
//       BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//     return ListView(
//       children: snapshot.data!.docs.map((DocumentSnapshot documentSnapshot) {
//         return ListTile(
//           title: Text(documentSnapshot['title']),
//           subtitle: Text(documentSnapshot['subtitle']),
//         );
//       }).toList(),
//     );
//   }
// }
