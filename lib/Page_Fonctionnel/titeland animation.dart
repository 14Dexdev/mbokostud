import 'package:flutter/material.dart';
import 'package:mbokostudy/Page_Fonctionnel/Utilisateur_Profil/MyProfil.dart';
class Titre extends StatefulWidget {
  const Titre({super.key});

  @override
  State<Titre> createState() => _TitreState();
}

class _TitreState extends State<Titre> {
 
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.fromLTRB(10, MediaQuery.of(context).padding.top, 10, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Bienvenu chez vous!",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  " Rien que pour les connaisseurs!",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
            Container(
                height: 70,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0),
                        elevation: 0),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => MyProfil())));
                    },
                    child:CircleAvatar(backgroundImage: AssetImage('images/smile-2072907_1280.jpg'),radius: 40,)
                     ))
          ],
        ));
  }
}
