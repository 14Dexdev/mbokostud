// ignore: duplicate_ignore
// ignore: file_names

// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mbokostudy/Tokendata/TokenBd.dart';
import 'package:http/http.dart';
import 'package:mbokostudy/Home%20mboko/Information.dart';
import 'package:mbokostudy/Parametre/model.dart';
// import 'package:mbokostudy/Tokendata/TokenBd.dart';

Client client = http.Client();
List<Salle> salle = [];
late final BuildContext context;
final endpointCreate = Uri.parse('http://10.0.2.2:8080/MbokoStd/Utilisateur/');

Future<void> creerUtilisateur(
    String email,
    String username,
    String firstname,
    String lastname,
    String password,
    String ville,
    String quatier,
    String date,
    context,
    role) async {
  final response = await http.Client().post(endpointCreate,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'username': username,
        'first_name': firstname,
        'last_name': lastname,
        'password': password,
        // 'photo':photo,
        'Ville': ville,
        'Quatier': quatier,
        'role': '$role',
        'Date_de_naissance': date
      }));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    var token = data['token'];
    saveToken(token);

    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      if (role == 'CLIENT') {
        return const Information();
      } else {
        return Information();
      }
    }));
  } else {
    // final error = jsonDecode(response.body);
    // SnackBar snackBar = SnackBar(
    //   content: Text('${response.body}'),
    // );
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
     print(response.body);
  }
}

// ignore: unused_element
Future<Map<String, dynamic>> connexionUser(
    String email, String password) async {
  final endpoint =
      Uri.parse('http://127.0.0.1:8000/Login/'); // Remplacez par votre URL
  final response = await http.post(endpoint,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception('Nom d\'utilisateur ou mot de passe incorrect');
  }
}

// ignore: unused_element
Future<Map<String, dynamic>> creerClient(matiere, user) async {
  final endpoints = Uri.parse(
      'http://10.0.2.2:8080/MbokoStd/Client/'); // Remplacez par votre URL
  final response = await http.Client().post(
    endpoints,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'user': user, 'classe': matiere}),
  );

  if (response.statusCode == 201) {
    final data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception(response.body);
  }
}

Future<Map<String, dynamic>> creerEnseignant(matiere, user) async {
  final endpoints = Uri.parse(
      'http://10.0.2.2:8080/MbokoStd/Client/'); // Remplacez par votre URL
  final response = await http.Client().post(
    endpoints,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'user': user, 'classe': matiere}),
  );

  if (response.statusCode == 201) {
    final data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception(response.body);
  }
}

Future<void> getEnseingnant() async {
  final endpoints = Uri.parse(
      'http://10.0.2.2:8080/MbokoStd/Enseignant/'); // Remplacez par votre URL
  final response = await http.Client().get(
    endpoints,
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print(data);
    return data;
  } else {
    throw Exception(response.body);
  }
}

Future<void> postCommentaire(
    String contenue, String client, int destinataire) async {
  final endpoints = Uri.parse(
      'http://10.0.2.2:8080/MbokoStd/Commentaire/'); // Remplacez par votre URL
  final response = await http.Client().post(endpoints,
      headers: {
        'Content-Type': 'application/json',
        'Autorization': 'Token ${getToken()}'
      },
      body: jsonEncode(
          {'repetiteur': destinataire, 'client': client, contenue: 'Contenu'}));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    print(data);
    return data;
  } else {
    throw Exception(response.body);
  }
}
