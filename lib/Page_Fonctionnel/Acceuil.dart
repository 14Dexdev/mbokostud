// ignore: duplicate_ignore
// ignore_for_file: file_names

// import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mbokostudy/Page_Fonctionnel/Ligne%20Matiere.dart';
import 'package:mbokostudy/Page_Fonctionnel/LigneRepetiteur.dart';
import 'package:mbokostudy/Page_Fonctionnel/titeland%20animation.dart';
import 'package:mbokostudy/Parametre/Gestions_backend.dart';
import 'package:mbokostudy/color.dart';

class Acceuil extends StatefulWidget {
  const Acceuil({super.key});

  @override
  State<Acceuil> createState() => _AcceuilState();
}

class _AcceuilState extends State<Acceuil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // leading: ,
            backgroundColor: Colors.white.withOpacity(0),
            title: SizedBox(
                height: 90,
                width: 140,
                child: Image.asset(
                    'images/9597128613b068f9db273b6f65746e3d - Copie.png')),
            toolbarHeight: 100,
            actions: [
              ElevatedButton(
                child: const Icon(Icons.search_outlined),
                onPressed: () {
                  getEnseingnant();
                },
              ),
            ]),
        
        body: ListView(children: [
          SizedBox(
            height: 200,
            child: Stack(children: [
              Transform(
                  transform: Matrix4.identity()..rotateZ(78),
                  origin: const Offset(150, 30),
                  child: Image.asset(
                    'images/My project-1.png',
                    height: 200,
                  )),
              Positioned(
                top: 100,
                right: 0,
                child: Transform(
                    transform: Matrix4.identity()..rotateZ(-50),
                    origin: const Offset(150, 60),
                    child: Image.asset(
                      'images/My project-1.png',
                      height: 200,
                    )),
              ),Column(children: [Titre()],)
            ]),
          ),
          Container(
              height: 1000,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white,
                  boxShadow: [BoxShadow()]),
              child: Column(children: [
                Container(
                  height: MediaQuery.sizeOf(context).height / 4,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  decoration: BoxDecoration(
                      boxShadow: const [BoxShadow()],
                      gradient: Couleurs().couleurfonds,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Top Repetiteur",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Couleurs().couleursfond,
                      ),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 203,
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      SizedBox(
                          height: 190,
                          child: Row(children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: const LigneRepetiteur(),
                            )

                            //
                          ])),
                    ])),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Qu'est ce que l'on fait aujourd'hui",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Couleurs().couleursfond,
                        ))),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 110,
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      SizedBox(
                          height: 90,
                          child: Row(children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: const LigneMatiere(),
                            )

                            //
                          ])),
                    ])),
              ])),
        ]));
  }
  //  else {
  //   return Center(child: CircularProgressIndicator());
}
