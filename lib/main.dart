import 'package:flutter/material.dart';
import 'package:mbokostudy/Home%20mboko/Information.dart';
import 'package:mbokostudy/Home%20mboko/Matieres.dart';
import 'package:mbokostudy/Home%20mboko/home.dart';
import 'package:mbokostudy/Page_Fonctionnel/Myhomepage.dart';
import 'package:mbokostudy/Parametre/model.dart';
import 'package:mbokostudy/Tokendata/tk.dart';
import 'package:mbokostudy/color.dart';


Future<void> main() async { 
  runApp(const MyApp());
  await HiveConfig.initHive();
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mboko Study',
      theme: ThemeData(scaffoldBackgroundColor: Couleurs().couleursfond,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 254, 254, 254)),
        useMaterial3: true,
      ),
      home:  const MyHomePage(),
    );
  }
}

