// import 'package:flutter/material.dart';
// import 'package:mbokostudy/Page_Fonctionnel/LigneRepetiteur.dart';
// import 'package:mbokostudy/color.dart';

// class Recommende extends StatefulWidget {
//   const Recommende({super.key});

//   @override
//   State<Recommende> createState() => _RecommendeState();
// }

// class _RecommendeState extends State<Recommende> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: FutureBuilder<dynamic>(
//             future: fetchSalles(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: 3,
//                     itemBuilder: (BuildContext context, index) {
//                       final salle = snapshot.data![index];

//                       return Container(
//                           height: 170,
//                           width: 220,
//                           decoration: BoxDecoration(
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(30)),
//                             color: Color.fromARGB(255, 255, 255, 255),

//                             // boxShadow:  [BoxShadow(blurRadius:0.5  ,blurStyle:  BlurStyle.normal)]
//                           ),
//                           margin: const EdgeInsets.all(10),
//                           child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   padding: EdgeInsets.symmetric(horizontal: 15),
//                                   backgroundColor: Colors.white,
//                                   surfaceTintColor:
//                                       const Color.fromARGB(255, 208, 207, 207),
//                                   elevation: 10,
//                                   shape: const RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(36)))),
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: ((context) =>
//                                             DetailRepetition(salle))));

//                               },
//                               child: Column(children: [
//                                 SizedBox(
//                                   height: 120,
//                                   width: 120,
//                                   child:
//                                       Image(image: NetworkImage(salle.Photo)),
//                                 ),
//                                 Row(children: [
//                                   SizedBox(
//                                     // ignore: sort_child_properties_last
//                                     child: Text(
//                                       salle.firstname,
//                                       style: const TextStyle(
//                                           fontSize: 18.5,
//                                           fontWeight: FontWeight.bold,
//                                           color: Color.fromARGB(195, 0, 0, 0)),
//                                     ),
//                                     height: 30,
//                                   ),

//                                   SizedBox(
//                                     width: 4,
//                                   ),
//                                   // ignore: sort_child_properties_last

//                                   Text(
//                                     "${salle.valeur}",
//                                     style: TextStyle(
//                                         fontSize: 17,
//                                         fontWeight: FontWeight.bold,
//                                         color: Couleurs().couleursfond),
//                                   ),
//                                   const SizedBox(
//                                     height: 7,
//                                   ),
//                                   Text(
//                                     " FCFA",
//                                     style: TextStyle(
//                                         fontSize: 17,
//                                         fontWeight: FontWeight.bold,
//                                         color: Couleurs().couleursfond),
//                                   ),
//                                 ]),

//                                 // ignore: avoid_unnecessary_containers
//                                 Container(
//                                     child: StarRating(
//                                   rating: salle.moyen,
//                                 ))
//                               ])));
//                     });
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Erreur: ${snapshot.error}'));
//               } else {
//                 return const Center(child: CircularProgressIndicator());
//               }
//             }));
//   }
// }