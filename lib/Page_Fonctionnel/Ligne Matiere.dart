import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mbokostudy/Home%20mboko/Compte.dart';
import 'package:mbokostudy/Parametre/model.dart';
// import 'package:mbokostudy/color.dart';

class LigneMatiere extends StatefulWidget {
  const LigneMatiere({super.key});

  @override
  State<LigneMatiere> createState() => _LigneMatiereState();
}

class _LigneMatiereState extends State<LigneMatiere> {
  fetchSalles() async {
    final response =
        await client.get(Uri.parse('http://10.0.2.2:8080/MbokoStd/Matiere/'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((produit) => Matiere.fromJson(produit)).toList();
    } else {
      throw Exception(
          'Erreur lors de la récupération : ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder<dynamic>(
            future: fetchSalles(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, index) {
                      final salle = snapshot.data![index];
                      // ignore: non_constant_identifier_names
                      String nom_matiere() {
                        if (salle.nom_matiere == "Langue FranÃ§aise") {
                          return 'Langue Francaise';
                        } else {
                          return salle.nom_matiere;
                        }
                      }

                      
                      return Container(
                          height: 80,
                          width: 116.5,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                            color: Color.fromARGB(255, 255, 255, 255),

                            // boxShadow:  [BoxShadow(blurRadius:0.5  ,blurStyle:  BlurStyle.normal)]
                          ),
                          margin: const EdgeInsets.all(10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  backgroundColor: Colors.white,
                                  surfaceTintColor:
                                      const Color.fromARGB(255, 144, 166, 252),
                                  elevation: 10,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)))),
                              onPressed: () {},
                              child: Column(children: [
                                SizedBox(
                                  height: 55,
                                  width: 55,
                                  child:
                                      Image(image: NetworkImage(salle.photo)),
                                ),
                                Row(children: [
                                  SizedBox(
                                    // ignore: sort_child_properties_last
                                    child: Text(
                                      nom_matiere(),
                                      style: const TextStyle(
                                          fontSize: 11.8,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(195, 0, 0, 0)),
                                    ),
                                    height: 30,
                                  ),

                                  // SizedBox(width:4,),
                                  //   // ignore: sort_child_properties_last

                                  //     Text(
                                  //      "${salle.valeur}" ,
                                  //       style:  TextStyle(
                                  //           fontSize: 17,
                                  //           fontWeight: FontWeight.bold,
                                  //           color: Couleurs().couleursfond),
                                  //     ),
                                  //     Text(
                                  //       " FCFA",
                                  //       style: TextStyle(

                                  //           fontSize: 17,
                                  //           fontWeight: FontWeight.bold,
                                  //           color: Couleurs().couleursfond),
                                  //     ),
                                ]),

                                // ignore: avoid_unnecessary_containers
                              ])));
                    });
              } else if (snapshot.hasError) {
                return Center(child: Text('Erreur: ${snapshot.error}'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
