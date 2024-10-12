// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mbokostudy/Parametre/model.dart';
import 'package:mbokostudy/Page_Fonctionnel/DetailRepetiteur.dart';
import 'package:mbokostudy/color.dart';
// ignore: depend_on_referenced_packages

// @JsonSerializable()

//   factory Enseignant.fromJson(Map<String, dynamic> json) =>
//       _$EnseignantFromJson(json);

//   Map<String, dynamic> toJson() => _$EnseignantToJson(this);
// }

class StarRating extends StatelessWidget {
  final double rating;

  StarRating({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return Icon(Icons.star, color: Colors.amber); // Étoile pleine
        } else if (index == rating.floor() && rating - rating.floor() >= 0.5) {
          return Icon(Icons.star_half, color: Colors.amber); // Demi-étoile
        } else {
          return Icon(Icons.star_border, color: Colors.grey); // Étoile vide
        }
      }),
    );
  }
}

class LigneRepetiteur extends StatefulWidget {
  const LigneRepetiteur({super.key});

  @override
  State<LigneRepetiteur> createState() => _LigneRepetiteurState();
}

class _LigneRepetiteurState extends State<LigneRepetiteur> {
  Client client = http.Client();
  @override
  initState() {
    super.initState();
    fetchSalles();
  }

  fetchSalles() async {
    final response = await client
        .get(Uri.parse('http://10.0.2.2:8080/MbokoStd/Enseignantget/'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);

      return data.map((produit) => Enseignant.fromJson(produit)).toList();
    } else {
      print(
          'Erreur lors de la récupération des salles: ${response.statusCode}');
    }
  }

  //  fechtuser() async {
  //   final response = await http.Client()
  //       .get(Uri.parse('http://10.0.2.2:8080/MbokoStd/Utilisateur/'));

  //   List users = jsonDecode(response.body);
  //   users.forEach((element) {
  //     user.add(User.fromMap(element));
  //   });
  // }

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
                    itemCount: 3,
                    itemBuilder: (BuildContext context, index) {
                      final salle = snapshot.data![index];

                      return Container(
                          height: 170,
                          width: 220,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            color: Color.fromARGB(255, 255, 255, 255),

                            // boxShadow:  [BoxShadow(blurRadius:0.5  ,blurStyle:  BlurStyle.normal)]
                          ),
                          margin: const EdgeInsets.all(10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  backgroundColor: Colors.white,
                                  surfaceTintColor:
                                      const Color.fromARGB(255, 208, 207, 207),
                                  elevation: 10,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(36)))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            DetailRepetition(salle))));
                              },
                              child: Column(children: [
                                SizedBox(
                                  height: 120,
                                  width: 120,
                                  child:
                                      Image(image: NetworkImage(salle.Photo)),
                                ),
                                Row(children: [
                                  SizedBox(
                                    // ignore: sort_child_properties_last
                                    child: Text(
                                      salle.firstname,
                                      style: const TextStyle(
                                          fontSize: 18.5,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(195, 0, 0, 0)),
                                    ),
                                    height: 30,
                                  ),

                                  SizedBox(
                                    width: 4,
                                  ),
                                  // ignore: sort_child_properties_last

                                  Text(
                                    "${salle.valeur}",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Couleurs().couleursfond),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    " FCFA",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Couleurs().couleursfond),
                                  ),
                                ]),

                                // ignore: avoid_unnecessary_containers
                                Container(
                                    child: StarRating(
                                  rating: salle.moyen,
                                ))
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
