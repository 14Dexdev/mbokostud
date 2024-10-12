// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mbokostudy/Home%20mboko/Sing.dart';
import 'package:mbokostudy/color.dart';

class Profilnav extends StatefulWidget {
  const Profilnav({super.key});

  @override
  State<Profilnav> createState() => _ProfilnavState();
}

int prod = 0;

class _ProfilnavState extends State<Profilnav> {
  Future<Null> lognout(String message, navigator) async {
    TextEditingController _password = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Deconnexion"),
            contentPadding: EdgeInsets.all(10),
            children: [
              Text(message),
              const SizedBox(height: 20,),
              TextField(
                textAlign: TextAlign.left,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hoverColor: Colors.white,
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 116, 119, 121)),
                  hintText: "Votre mot de passe pour vous deconnecter",
                  labelText: "Password",
                ),
                controller: _password,
              ),const Divider(height: 20,),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => navigator));
                      },
                      child: Text('deconnexion')),
                      const SizedBox(width: 20,),
                  ElevatedButton(
                    child: Text(
                      'annuler',
                      style: TextStyle(color: Couleurs().couleursfond),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white.withOpacity(0),
              elevation: 0,
              bottom: const TabBar(tabs: <Widget>[
                Tab(
                    child: Text('Evolution',
                        style: TextStyle(
                            color: Color.fromARGB(255, 82, 82, 82),
                            fontWeight: FontWeight.w600))),
                Tab(
                  child: Text(
                    "Favorie",
                    style: TextStyle(
                        color: Color.fromARGB(255, 82, 82, 82),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Tab(
                  child: Text("Information",
                      style: TextStyle(
                          color: Color.fromARGB(255, 82, 82, 82),
                          fontWeight: FontWeight.w600)),
                )
              ]),
            ),
            body: TabBarView(children: [
              Container(
                padding: const EdgeInsets.all(20),
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Column(children: [
                  ElevatedButton(
                      onPressed: () {
                        prod++;
                        const Navigator();
                      },
                      child: const Text("Generer un Emploi du temps")),
                ]),
              ),

              //page2
              Container(
                color: Colors.black,
                child: const Column(),
              ),

              // Page 3
              Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  color: Colors.white,
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          // const Text(
                          //   ,
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.bold, fontSize: 20),
                          // ),
                         SizedBox(
                height: 65,
                width: 380,
                child: GestureDetector(
                  onTap: () {},
                  // ignore: sort_child_properties_last
                  child: Row(children: [
                    Icon(Icons.local_library_sharp,
                        size: 20, color: Couleurs().couleursfond),
                   
                    Text("Enseignant",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Couleurs().couleursfond,
                        )),const SizedBox(
              height: 10,
            ),
                        Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),
                        
                  ],mainAxisAlignment: MainAxisAlignment.spaceAround,),
                 
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 65,
              width: 380,
              child: GestureDetector(
                onTap: () {},
                // ignore: sort_child_properties_last
                child: Row(children: [
                  // ignore: prefer_const_constructors
                  Icon(
                      color: Couleurs().couleursfond,
                      Icons.settings_outlined,
                      size: 20,
                    ),
                   
                  Text("Information",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Couleurs().couleursfond,
                      )),const SizedBox(
              height: 10,
            ), Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),
                        
                  ],mainAxisAlignment: MainAxisAlignment.spaceAround,),
                 
                
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 65,
                width: 380,
                child: GestureDetector(
                  onTap: () {},
                  child: Row(children: [
                    Icon(
                      color: Couleurs().couleursfond,
                      Icons.settings_outlined,
                      size: 20,
                    ),
                   
                    Text("Parametre",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Couleurs().couleursfond,
                        )),const SizedBox(
              height: 10,
            ), Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),
                        
                  ],mainAxisAlignment: MainAxisAlignment.spaceAround,),
                 ),
                ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 65,
                width: 380,
                child: GestureDetector(
                  onTap: () {},
                  // ignore: sort_child_properties_last
                  child: Row(children: [
                    const Icon(
                      Icons.logout_outlined,
                      size: 20,
                      color: Colors.redAccent,
                    ),
                   
                    const Text("Deconnexion",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.redAccent,
                        )),const SizedBox(
              height: 10,
            ), Icon(Icons.arrow_forward_ios_outlined,color: Colors.redAccent,),
                        
                  ],mainAxisAlignment: MainAxisAlignment.spaceAround,),
                 ),
                 
                )
                        ],
                      )
                    ],
                  ))
            ])));
  }
}
