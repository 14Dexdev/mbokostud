import 'dart:io';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mbokostudy/Tokendata/tk.dart';



class MyModelAdapter extends TypeAdapter<MyModel> {

  @override
  final int typeId = 1; // Définissez un ID unique pour votre modèle

  @override
  MyModel read(BinaryReader reader) {
    final token = reader.readString();
  
    return MyModel(token: token);
  }
  
  @override
  void write(BinaryWriter writer, MyModel obj) {
    // TODO: implement write
  }
}

Future<void> saveToken(String token) async {

  final box = Hive.box('tokenBox');
  box.put('token', MyModel(token: token));
}

Future<String?> getToken() async {
  final box = await Hive.openBox('tokenBox');
  return box.get('token');
}

// ignore: non_constant_identifier_names
