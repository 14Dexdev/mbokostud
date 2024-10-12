import 'package:flutter/material.dart';
import 'package:mbokostudy/color.dart';

class Livre extends StatefulWidget {
  const Livre({super.key});

  @override
  State<Livre> createState() => _LivreState();
}

class _LivreState extends State<Livre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(title: SearchBar(hintText: "Recher un Support",leading: Icon(Icons.search_outlined),),),
   body: Container(padding: EdgeInsets.all(20),child: 
   ListView(children: [
    Container(alignment: Alignment.center,child: Text('Recommende',style:TextStyle(color:Couleurs().couleursfond,fontSize: 25,fontWeight: FontWeight.bold)),margin: EdgeInsets.symmetric(vertical: 20),),
   ],), ));
    
  }
}
