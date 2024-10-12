import 'package:flutter/material.dart';
import 'package:mbokostudy/color.dart';

import '../../Home mboko/Sing.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: ,
        backgroundColor: Colors.white.withOpacity(0),
        title: SizedBox(
            height: 90,
            width: 140,
            child: Image.asset(
                'images/9597128613b068f9db273b6f65746e3d - Copie.png')),
        toolbarHeight: 100,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Card(shadowColor: Colors.white.withOpacity(0),
                color:Colors.white.withOpacity(0
                ) ,
                // Couleurs().couleursfond,
                child: Container(color: Colors.white,
                  // color: Couleurs().couleursfond,
                  padding: const EdgeInsets.all(10),
                  child: const Column(
                    children: [
                      Row(
                        // ignore: sort_child_properties_last
                        children: [
                          CircleAvatar(
                            radius: 40,
                          ),
                         
                          Text(
                            'Mr Lala',
                            style: TextStyle(fontSize: 25),
                          ), SizedBox(width: 20,),
                        Icon(Icons.arrow_forward_ios_outlined)
                       
                        ],
                      mainAxisAlignment: MainAxisAlignment.spaceAround,)
                    ],
                  ),
                )),
            const SizedBox(
              height: 120,
            ),
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
        ),
      ),
    );
  }
}
