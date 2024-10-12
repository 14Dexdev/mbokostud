// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../color.dart';

class Matieres extends StatefulWidget {
  const Matieres({super.key});

  @override
  State<Matieres> createState() => _MatieresState();
}

List<dynamic> matieres = [];

class _MatieresState extends State<Matieres> {
  @override
  void initState() {
    super.initState();
    matiere();
  }

  Future<void> matiere() async {
    final response = await http.Client().get(
        Uri.parse('http://10.0.2.2:8080/MbokoStd/Matiere/'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      setState(() {
        matieres = jsonDecode(response.body);
      });
    } else {
      throw {Exception(response.body)};
    }
  }

  @override
  Widget build(BuildContext context) {
    var mat = matieres.map((salle) => salle['nom_matiere'] as String);

    var salle = [];
    bool couleur = true;

    Widget BouttonMboko(var n) {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 7),
          height: 45,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              surfaceTintColor:
                  couleur ? Couleurs().couleursfond : Colors.white,
              backgroundColor: couleur ? Couleurs().couleursfond : Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const Matieres(),
                ),
              );
              setState(() {
                couleur = !couleur;
                var s = matieres.map((e) => e['id'] as int).elementAt(n);
                if (salle.contains(s)) {
                  salle.remove(s);
                } else {
                  salle.add(s);
                }
              });
            },
            child: Text(
              '${mat.elementAt(n)}',
              style: TextStyle(
                color: couleur ? Colors.white : Couleurs().couleursfond,
              ),
            ),
          ));
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.sizeOf(context).height / 9,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "images/télécharger.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          backgroundColor: Colors.white.withOpacity(0),
        ),
        body: Container(
            width: MediaQuery.sizeOf(context).width,
            color: Colors.white,
            child: Column(children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 29,
                width: MediaQuery.sizeOf(context).width / 2,
              ),
              const Text(
                """     Quel sont vos   
  difficultes actuel ?""",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 18,
                width: MediaQuery.sizeOf(context).width / 2,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  height: 520,
                  child: ListView(children: [
                    Row(
                      children: [
                        BouttonMboko(
                          1,
                        ),
                        const SizedBox(width: 20),
                        BouttonMboko(2)
                      ],
                    ),
                    BouttonMboko(0),
                    Row(
                      children: [
                        const SizedBox(width: 40),
                        SizedBox(
                          width: 310,
                          child: BouttonMboko(3),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                            width: 310,
                            child: BouttonMboko(
                              4,
                            )),
                        const SizedBox(width: 40),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 50),
                        BouttonMboko(5),
                        const SizedBox(width: 20),
                        BouttonMboko(6)
                      ],
                    ),
                    BouttonMboko(
                      7,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 210, child: BouttonMboko(8)),
                        const SizedBox(width: 10),
                        BouttonMboko(9)
                      ],
                    ),
                    Row(
                      children: [
                        BouttonMboko(10),
                        const SizedBox(width: 10),
                        SizedBox(width: 210, child: BouttonMboko(11)),
                      ],
                    ),
                    BouttonMboko(13),
                    const SizedBox(width: 10),
                    BouttonMboko(14),
                    const SizedBox(width: 10),
                    SizedBox(width: 150, child: BouttonMboko(15)),
                  ]))
            ])));
  }
}
