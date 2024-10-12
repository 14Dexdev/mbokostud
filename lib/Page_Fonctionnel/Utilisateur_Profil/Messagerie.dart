import 'package:flutter/material.dart';
import 'package:mbokostudy/color.dart';

// ignore: must_be_immutable
class Messagerie extends StatelessWidget {
  Messagerie(this.fech,{super.key});
 
 
   var fech;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: fech,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final salle = snapshot.data![index];
                   if(salle.envoyeur=='user'){return
                  
                       Container(height:double.parse('${salle.contenu.length+20}'),
                       alignment: Alignment.centerLeft,
                       color:Couleurs().couleursfond,
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text('${salle.contenue}',style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  );
          }else{
            return
                       Container(height:double.parse('${salle.contenu.length+20}'),
                       alignment: Alignment.centerRight,
                       color:Colors.white,
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Text('${salle.contenue}',style: TextStyle(color:Couleurs().couleursfond),)
                      ],
                    ),
                  );
          }});
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
