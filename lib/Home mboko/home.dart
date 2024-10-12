import 'package:flutter/material.dart';
import 'package:mbokostudy/Home%20mboko/Sing.dart';
import 'package:mbokostudy/color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: Couleurs().couleurfonds),
        child: Column(
          children: [
            Image.asset("images/télécharger.png"),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 19,
              width: MediaQuery.sizeOf(context).width / 2,
            ),
            Image.asset("images/9597128613b068f9db273b6f65746e3d - Copie.png"),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 18,
              width: MediaQuery.sizeOf(context).width / 2,
            ),
            Center(child: Image.asset("images/Study 4.png")),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 10,
              width: MediaQuery.sizeOf(context).width / 2,
            ),
            Container(
              width: 200,
              height: MediaQuery.sizeOf(context).height / 14,
              decoration: BoxDecoration(
                  gradient: Couleurs().couleurboutton,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0))),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  shadowColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Bienvenue',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return const Singin();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
