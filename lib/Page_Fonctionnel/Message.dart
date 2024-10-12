import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mbokostudy/Home%20mboko/Compte.dart';
import 'package:mbokostudy/Page_Fonctionnel/Commentaire.dart';
import 'package:mbokostudy/Parametre/model.dart';
import 'package:mbokostudy/color.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  fetchSalles() async {
    final response = await client.get(
        Uri.parse('http://10.0.2.2:8080/MbokoStd/Search/?q=1'));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);

      return data.map((produit) => Commentaire.fromJson(produit)).toList();
    } else {
      print(
          'Erreur lors de la récupération des salles: ${response.statusCode}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(title: SearchBar(hintText: "Recher de Message",leading: Icon(Icons.search_outlined),),),
   body: Container(padding: EdgeInsets.all(20),child: 
   ListView(children: [
    Container(alignment: Alignment.center,child: Text('Messagerie',style:TextStyle(color:Couleurs().couleursfond,fontSize: 25,fontWeight: FontWeight.bold)),margin: EdgeInsets.symmetric(vertical: 20),),
    Commente(fetchSalles()),
   ],), ));
    
  }
}
