// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mbokostudy/Page_Fonctionnel/Commentaire.dart';
import 'package:mbokostudy/Page_Fonctionnel/LigneRepetiteur.dart';
import 'package:mbokostudy/Parametre/Gestions_backend.dart';
import 'package:mbokostudy/Parametre/model.dart';
import 'package:mbokostudy/color.dart';

// ignore: must_be_immutable
class DetailRepetition extends StatelessWidget {
  DetailRepetition(this.enseignant, {super.key});
  
  fetchSalles() async {
    final response = await client.get(
        Uri.parse('http://10.0.2.2:8080/MbokoStd/Search/?q=${enseignant.id}'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);

      return data.map((produit) => Commentaire.fromJson(produit)).toList();
    } else {
      print(
          'Erreur lors de la récupération des salles: ${response.statusCode}');
    }
  }

   classe() async {
    final response = await client.get(
        Uri.parse('http://10.0.2.2:8080/MbokoStd/Salle/'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Salle.fromJSon(e)).toList();
    } else {
      throw Exception(
          'Erreur lors de la récupération des salles: ${response.statusCode}');
    }
  }

  // calles(context, fet) {
  //   FutureBuilder<dynamic>(
  //       future: fet,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           return ListView.builder(
  //               scrollDirection: Axis.horizontal,
  //               itemCount: snapshot.data!.length,
  //               itemBuilder: (BuildContext context, index) {
  //                 final salle =snapshot.data![enseignant.classe.elementAt(index)];

  //                 return Container();
  //               });
  //         } else {
  //           return Text('Loaing...');
  //         }
  //       });
  // }

  final Enseignant enseignant;
  final TextEditingController _controllercontenu = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 144, 166, 255),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 90,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                maximumSize: const Size(150, 150), shape: const CircleBorder()),
            child: CircleAvatar(
              backgroundImage: NetworkImage(enseignant.Photo),
              radius: 120,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              """${enseignant.firstname} ${enseignant.lastname}""",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              """ ${enseignant.email}    Age: ${enseignant.age}""",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 245, 245, 245)),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 2000,
            width: MediaQuery.sizeOf(context).width,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                            '${enseignant.moyen}',
                            style: const TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w400),
                          ),
                          StarRating(rating: enseignant.moyen)
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                        onTap: () {
                          postCommentaire(
                              _controllercontenu.text, '', enseignant.id);
                        },
                        child: SizedBox(
                            height: 40, child: Image.asset('images/jus.png'))),
                    Container(
                        margin: EdgeInsets.all(20),
                        width: 140,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Couleurs().couleursfond,
                              surfaceTintColor: Couleurs().couleursfond),
                          onPressed: () {},
                          child: Text(
                            'Contacter',
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // calles(context, classe()),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Text("Bio",
                        style: TextStyle(
                            fontSize: 25,
                            height: 2,
                            fontWeight: FontWeight.w600,
                            color: Couleurs().couleursfond)),
                    Text(
                      """${enseignant.description}""",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Commentaire",
                    style: TextStyle(
                        fontSize: 25,
                        height: 2,
                        fontWeight: FontWeight.w600,
                        color: Couleurs().couleursfond)),
                Container(
                    height: 350,
                    child: Commente(fetchSalles()),
                    color: Colors.white)
              ],
            ),
          )
        ],
      ),
    );
  }
}
