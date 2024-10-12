// ignore: duplicate_ignore
// ignore: file_names, duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mbokostudy/Parametre/Gestions_backend.dart';
import 'package:mbokostudy/color.dart';

import 'Compte.dart';

class Singin extends StatefulWidget {
  const Singin({super.key});

  @override
  State<Singin> createState() => _SinginState();
}

class _SinginState extends State<Singin> {
  var MotdepasseVisble = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _connexion() async {
    try {
      //  final response =
      await connexionUser(_emailController.text, _passwordController.text);

      // ... Traitement de la réponse (enregistrement du token)
    } catch (error) {
      // ... Affichage d'un message d'erreur
    }
  }
  // ... Traitement de la réponse (enregistrement du token)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(toolbarHeight:MediaQuery.sizeOf(context).height/7 ,
          flexibleSpace: FlexibleSpaceBar(background:
          
            Image.asset("images/télécharger.png",fit:BoxFit.fitWidth)),
          ),
        
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          // color: Couleurs().couleursfond,
          color: Colors.white,
          child: ListView(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 30,
              ),
              Image.asset(
                  "images/9597128613b068f9db273b6f65746e3d - Copie.png"),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 18,
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 40.0),
                child: const Text(
                  "Connexion",
                  // ignore: deprecated_member_use
                  textScaleFactor: 2.5,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 48,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 1.2,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Veuillez saisir un nom d'utilisateur";
                    }
                    return null;
                  },
                  textAlign: TextAlign.left,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.mail_outline,
                        color: Colors.blueAccent,
                      ),
                      hoverColor: Colors.white,
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 116, 119, 121)),
                      hintText: "Entrer votre adresse",
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 42,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 1.2,
                child: TextField(
                 
                  textAlign: TextAlign.left,
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(errorText: "Entrez un mot de passe valide ",
                    suffixIcon: IconButton(
                      icon: MotdepasseVisble
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () => setState(() {
                        MotdepasseVisble = !MotdepasseVisble;
                      }),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    icon: Icon(
                      Icons.lock_outline,
                      color: Colors.blueAccent,
                    ),
                    hoverColor: Colors.white,
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 116, 119, 121)),
                    hintText: "Entrer votre mot de passe",
                    labelText: "Password",
                  ),
                  obscureText: MotdepasseVisble,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 38,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width / 1.18,
                height: MediaQuery.sizeOf(context).height / 14,
                decoration: BoxDecoration(
                    gradient: Couleurs().couleurboutton,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(40.0))),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    shadowColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Connexion',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: _connexion,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 38,
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  child: const Text(
                    "Creer un compte",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.wavy,
                      decorationColor: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const Compte();
                    }));
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 38,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Container(
                      height: 2,
                      color: Colors.grey,
                      width: MediaQuery.sizeOf(context).width / 2.9,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Or"),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 2,
                      color: Colors.grey,
                      width: MediaQuery.sizeOf(context).width / 2.9,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 38,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 1.18,
                height: MediaQuery.sizeOf(context).height / 14,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 255, 255, 255)),
                    shadowColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/google.png",
                        height: 30.5,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        'Google',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 22, 22, 22)),
                      )
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ));
  }
}
