// ignore_for_file: file_names, constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mbokostudy/Parametre/Gestions_backend.dart';
import 'package:mbokostudy/color.dart';
import 'package:http/http.dart' as http;

import 'package:http/http.dart';

Client client = http.Client();

class Compte extends StatefulWidget {
  const Compte({super.key});

  @override
  State<Compte> createState() => _CompteState();
}

class _CompteState extends State<Compte> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  // final TextEditingController _photoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Ville? _ville;
  Role? _role;
  TextEditingController _datedenaissance = TextEditingController();
  late DateTime? date;
  final TextEditingController _adresseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.sizeOf(context).height / 3.7,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: [
                Image.asset("images/télécharger.png", fit: BoxFit.fitWidth),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 29,
                  width: MediaQuery.sizeOf(context).width / 2,
                ),
                Image.asset(
                    "images/9597128613b068f9db273b6f65746e3d - Copie.png"),
              ],
            ),
          ),
          backgroundColor: Colors.white.withOpacity(0),
          leading: IconButton(
            alignment: Alignment.topRight,
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        // backgroundColor: Couleurs().couleursfond,
        body: Form(
            key: _formKey,
            child: Container(
                width: MediaQuery.sizeOf(context).width,
                margin: const EdgeInsets.all(30.0),
                child: ListView(children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 18,
                    width: MediaQuery.sizeOf(context).width / 2,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.2,
                    child: TextField(
                      textAlign: TextAlign.left,
                      controller: _usernameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        icon: Icon(
                          Icons.person_2_outlined,
                          color: Colors.blueAccent,
                        ),
                        hoverColor: Colors.white,
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 116, 119, 121)),
                        hintText: "Entrer votre nom d'utilisateur",
                        labelText: "Nom d'utilisateur",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 38,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.2,
                    child: TextField(
                      textAlign: TextAlign.left,
                      controller: _firstnameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        icon: Icon(
                          Icons.person_2_outlined,
                          color: Colors.blueAccent,
                        ),
                        hoverColor: Colors.white,
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 116, 119, 121)),
                        hintText: "Entrer votre Nom",
                        labelText: "Nom",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 38,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.2,
                    child: TextField(
                      textAlign: TextAlign.left,
                      controller: _lastnameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        icon: Icon(
                          Icons.person_2_outlined,
                          color: Colors.blueAccent,
                        ),
                        hoverColor: Colors.white,
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 116, 119, 121)),
                        hintText: "Entrer votre Prenom",
                        labelText: "Prenom",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 38,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.2,
                    child: TextField(
                      textAlign: TextAlign.left,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        icon: Icon(
                          Icons.email_outlined,
                          color: Colors.blueAccent,
                        ),
                        hoverColor: Colors.white,
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 116, 119, 121)),
                        hintText: "Entrer votre Email",
                        labelText: "Email",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 38,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.2,
                    child: TextField(
                      textAlign: TextAlign.left,
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        icon: Icon(
                          Icons.lock_outline,
                          color: Colors.blueAccent,
                        ),
                        hoverColor: Colors.white,
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 116, 119, 121)),
                        hintText: "Entrer votre mot de passe",
                        labelText: "Password",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 38,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.2,
                    child: TextField(
                      textAlign: TextAlign.left,
                      controller: _datedenaissance,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_month_outlined,
                              color: Couleurs().couleursfond),
                          onPressed: () {
                            Future<Null> Datedenaissance() async {
                              DateTime? choix = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1960),
                                  lastDate: DateTime.now());

                              setState(() {
                                _datedenaissance = choix.toString() as TextEditingController;
                              });
                            }
                         
                            Datedenaissance();
                          },
                        ),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        icon: const Icon(
                          Icons.cake_outlined,
                          color: Colors.blueAccent,
                        ),
                        hoverColor: Colors.white,
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 116, 119, 121)),
                        hintText: "yyyy-mm-jj",
                        labelText: "Date de naissance",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 38,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width / 1.18,
                    height: MediaQuery.sizeOf(context).height / 14,
                    decoration: BoxDecoration(
                        color: Couleurs().couleursfond.withOpacity(0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40.0))),
                    child: DropdownButton<Ville>(
                        icon: Icon(Icons.location_on_outlined),
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        value: _ville,
                        menuMaxHeight: 200,
                        items: Ville.values.map((Ville type) {
                          return DropdownMenuItem<Ville>(
                            value: type,
                            child: Text(type.name),
                          );
                        }).toList(),
                        onChanged: (Ville? newValue) {
                          setState(() {
                            _ville = newValue;
                          });
                        }),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 38,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width / 1.2,
                    child: TextField(
                      textAlign: TextAlign.left,
                      controller: _adresseController,
                      keyboardType: TextInputType.streetAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        icon: Icon(
                          Icons.location_city_outlined,
                          color: Colors.blueAccent,
                        ),
                        hoverColor: Colors.white,
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 116, 119, 121)),
                        hintText: "Entrer votre Quartier",
                        labelText: "Adresse",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 38,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width / 1.18,
                    height: MediaQuery.sizeOf(context).height / 14,
                    decoration: BoxDecoration(
                        color: Couleurs().couleursfond.withOpacity(0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40.0))),
                    child: DropdownButton<Role>(
                        value: _role,
                        items: Role.values.map((Role type) {
                          return DropdownMenuItem<Role>(
                            value: type,
                            child: Text(type.name),
                          );
                        }).toList(),
                        onChanged: (Role? newValue) {
                          setState(() {
                            _role = newValue;
                          });
                        },
                        borderRadius: BorderRadius.all(Radius.circular(30)),),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 18,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width / 1.8,
                    height: MediaQuery.sizeOf(context).height / 14,
                    decoration: BoxDecoration(
                        gradient: Couleurs().couleurboutton,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40.0))),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Creer',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () {
                          String _roles;
                          if (_role == Role.Abonnee) {
                            _roles = 'CLIENT';
                          } else {
                            _roles = 'ENSEIGNANT';
                          }
                          String _villes;

                          switch (_ville) {
                            case Ville.Bafoussam:
                              _villes = 'BAFOUSSAM';
                              break;
                            case Ville.Bertoua:
                              _villes = 'BERTOUA';
                              break;
                            case Ville.Buea:
                              _villes = 'BUEA';
                              break;
                            case Ville.Douala:
                              _villes = 'DOUALA';
                              break;
                            case Ville.Dschang:
                              _villes = 'DSCHANG';
                              break;
                            case Ville.Ebolowa:
                              _villes = 'EBOLOWA';
                              break;
                            case Ville.Edea:
                              _villes = 'EDEA';
                              break;
                            case Ville.Garoua:
                              _villes = 'GAROUA';
                              break;
                            case Ville.Kribi:
                              _villes = 'KRIBI';
                              break;
                            case Ville.Limbe:
                              _villes = 'LIMBE';
                              break;
                            case Ville.Maroua:
                              _villes = 'MAROUA';
                              break;
                            case Ville.Mbanga:
                              _villes = 'MBANGA';
                              break;
                            case Ville.Ngaoundere:
                              _villes = 'NGAOUNDERE';
                              break;
                            case Ville.Souza:
                              _villes = 'SOUZA';
                              break;
                            case Ville.Tiko:
                              _villes = 'TIKO';
                              break;
                            case Ville.Yaounde:
                              _villes = 'YAOUNDE';
                              break;
                            case null:
                              _villes = 'DOUALA';
                            // TODO: Handle this case.
                          }

                          creerUtilisateur(
                              _emailController.text,
                              _usernameController.text,
                              _firstnameController.text,
                              _lastnameController.text,
                              _passwordController.text,
                              _villes,
                              _adresseController.text,
                              _datedenaissance.text,context,
                              _roles);

                          // if (_roles == 'CLIENT' &&
                          //    ) {
                          //   Navigator.push(context, MaterialPageRoute(
                          //       builder: (BuildContext context) {
                          //     return const Information();
                        }),
                  ),
                ]))));
  }

  // ignore: non_constant_identifier_names
}

enum Role { Repetiteur, Abonnee }

enum Ville {
  Douala,
  Yaounde,
  Bertoua,
  Ebolowa,
  Buea,
  Limbe,
  Bafoussam,
  Dschang,
  Kribi,
  Mbanga,
  Edea,
  Tiko,
  Maroua,
  Garoua,
  Ngaoundere,
  Souza
}
