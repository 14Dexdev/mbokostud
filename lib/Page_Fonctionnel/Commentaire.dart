import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class Commente extends StatelessWidget {
  Commente(this.fech,{super.key});
  var fech;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: FutureBuilder<dynamic>(
          future: fech,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final salle = snapshot.data![index];
                    return Card(color:Colors.white ,
                          child: Container(padding: EdgeInsets.all(20),
                          color: Colors.white.withOpacity(0),
                        child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(salle.Photo),
                                  radius: 30,
                                ),
                              ), SizedBox(width: 20,),Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text('${salle.username}',style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('${salle.contenue}') ],)
                             
                            ],
                          ),
                        ));
                  });
            } else if (snapshot.hasError) {
              return Center(child: Text('Erreur: ${snapshot.error}'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
