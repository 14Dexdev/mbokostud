// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mbokostudy/Home%20mboko/Matieres.dart';
import 'package:mbokostudy/color.dart';
import 'package:http/http.dart' as http;

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  // ignore: prefer_typing_uninitialized_variables
  List<dynamic> salles = [];

  @override
  void initState() {
    super.initState();
    classe();
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

  // ignore: non_constant_identifier_names

  Future<void> classe() async {
    final response = await http.Client().get(
        Uri.parse('http://10.0.2.2:8080/MbokoStd/Salle/'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      setState(() {
        salles = jsonDecode(response.body);
      });
    } else {
      throw Exception(
          'Erreur lors de la récupération des salles: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool couleur = true;
    var classes = salles.map((salle) => salle['classe'] as String);
    // ignore: non_constant_identifier_names
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
              var sall = [];
              sall.add(matieres.map((e) => e['id'] as int).elementAt(n));
              couleur = !couleur;
            },
            child: Text(
              '${classes.elementAt(n)}',
              style: TextStyle(
                color: couleur ? Colors.white : Couleurs().couleursfond,
              ),
            ),
          ));
    }

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.sizeOf(context).height / 9,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              "images/télécharger.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          leading: IconButton(
            alignment: Alignment.topRight,
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white.withOpacity(0),
        ),
        backgroundColor: Colors.white,
        body: Container(
            width: MediaQuery.sizeOf(context).width,
            color: Colors.white,
            child: Column(children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 29,
                width: MediaQuery.sizeOf(context).width / 2,
              ),
              const Text(
                """     Quel est votre 
    niveau actuel ?""",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 18,
                width: MediaQuery.sizeOf(context).width / 2,
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  height: 520,
                  child: salles.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView(children: [
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
                              SizedBox(
                                  width: 210,
                                  child: BouttonMboko(
                                    8,
                                  )),
                              const SizedBox(width: 10),
                              BouttonMboko(10)
                            ],
                          ),
                          Row(
                            children: [
                              BouttonMboko(9),
                              const SizedBox(width: 10),
                              SizedBox(
                                  width: 210,
                                  child: BouttonMboko(11)),
                            ],
                          ),
                          Row(
                            children: [
                              BouttonMboko(13),
                              const SizedBox(width: 10),
                              SizedBox(
                                  width: 210,
                                  child: BouttonMboko(14)),
                            ],
                          ),
                          BouttonMboko(16),
                          const SizedBox(width: 10),
                          SizedBox(
                              width: 150,
                              child: BouttonMboko(15)),
                        ]))
            ])));
  }
}
