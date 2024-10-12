import 'package:flutter/material.dart';
import 'package:mbokostudy/Page_Fonctionnel/Utilisateur_Profil/Profilnav.dart';

class MyProfil extends StatefulWidget {
  const MyProfil({super.key});

  @override
  State<MyProfil> createState() => _MyProfilState();
}

class _MyProfilState extends State<MyProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text("Profil",
                  style: TextStyle(
                      color:
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 22)),
              backgroundColor: Colors.white.withOpacity(0),
              elevation: 0,
             
                  
                
              ),
            
            body: ListView(children: [
              Stack(children: [
                Transform(
                    transform: Matrix4.identity()..rotateZ(78),
                    origin: Offset(130, 50),
                    child: Image.asset(
                      'images/My project-1.png',
                      height: 200,
                    )),
                Positioned(
                  top: 100,
                  right: 0,
                  child: Transform(
                      transform: Matrix4.identity()..rotateZ(-50),
                      origin: Offset(150, 60),
                      child: Image.asset(
                        'images/My project-1.png',
                        height: 200,
                      )),
                ),
                Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                ),
                                child: Stack(
                                  children: [
                                    CircleAvatar(backgroundImage: AssetImage('images/smile-2072907_1280.jpg'),radius: 100,),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add_a_photo,
                                          color: Color.fromARGB(255, 255, 255, 255),
                                        ))
                                  ],
                                )),
                          ),
                          Container(
                            child: Text(
                              "User Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 25),
                            ),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: EdgeInsets.all(7.3),
                                  child: Container(
                                    child: Text(
                                      "MbokoProfil@Email.com",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: const Color.fromARGB(255, 255, 255, 255)),
                                    ),
                                  )))
                        ],
                      ),
                    ),
                    Container(
                        height: 800,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Profilnav())
                  ],
                )
              ]),
            ]));
  
  }
}