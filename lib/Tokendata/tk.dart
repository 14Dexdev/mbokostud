import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mbokostudy/Tokendata/TokenBd.dart';

class HiveConfig {
  static Future<void> initHive() async {
    // Initialiser Hive
    await Hive.initFlutter();

    // Enregistrer les adaptateurs pour les types personnalisés
    Hive.registerAdapter(MyModelAdapter()); // Remplacez MyModelAdapter

    // Ouvrir les boîtes de données
    await Hive.openBox('myBox'); // Remplacez 'myBox' par le nom de votre boîte
  }
}

class MyModel {
  final String token;

  MyModel({required this.token});
}