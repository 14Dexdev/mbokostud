// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

// import 'package:mbokostudy/Home%20mboko/Matiere.dart';

class User {
  String email;
  String username;
  String firstname;
  String lastname;
  String password;
  String adresse;
  String role;
  String photo;
  User(
      {required this.email,
      required this.username,
      required this.firstname,
      required this.lastname,
      required this.password,
      required this.adresse,
      required this.role,
      required this.photo});

  User copywith(
      {String? email,
      String? username,
      String? firstname,
      String? lastname,
      String? password,
      String? adresse,
      String? role,
      String? photo}) {
    return User(
        email: email ?? this.email,
        username: username ?? this.username,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        password: password ?? this.password,
        adresse: adresse ?? this.adresse,
        role: role ?? this.role,
        photo: photo ?? this.photo);
  }

  Map<String, dynamic> toMap() {
    return {
      email: 'email',
      username: 'username',
      firstname: 'firstname',
      lastname: 'lastname',
      password: 'password',
      adresse: 'adresse',
      role: 'role',
      photo: 'photo'
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        email: map['email'],
        username: map['username'],
        firstname: map['firstname'],
        lastname: map['lastname'],
        password: map['password'],
        adresse: map['adresse'],
        role: map['role'],
        photo: map['photo']);
  }
  JsonEncoder toJson() => json.encoder;

  factory User.fromJSon(String source) =>
      User.fromMap(json.decoder as Map<String, dynamic>);
  @override
  String toString() => '''User(email: $email ,
        username: $username ,
        firstname: $firstname ,
        lastname: $lastname ,
        password: $password ,
        adresse: $adresse ,
        role: $role ,
        photo: $photo)''';
}

class Ensegnant {
  String id;
  Map user;
  String specialite;
  String classe;
  String moyen;
  String valeur;
  String reussite;
  String echec;
  String requete;
  String description;

  Ensegnant(
      {required this.id,
      required this.user,
      required this.specialite,
      required this.classe,
      required this.moyen,
      required this.valeur,
      required this.reussite,
      required this.echec,
      required this.requete,
      required this.description});

  Ensegnant copywith(
      {String? id,
      String? specialite,
      String? moyen,
      String? valeur,
      String? reussite,
      String? echec,
      String? requete,
      String? description,
      Map? user,
      String? classe}) {
    return Ensegnant(
        id: id ?? this.id,
        specialite: specialite ?? this.specialite,
        moyen: moyen ?? this.moyen,
        valeur: valeur ?? this.valeur,
        reussite: reussite ?? this.reussite,
        echec: echec ?? this.echec,
        requete: requete ?? this.requete,
        description: description ?? this.description,
        user: user ?? this.user,
        classe: classe ?? this.classe);
  }

  Map<String, dynamic> toMap() {
    return {
      id: 'id',
      specialite: 'specialite',
      classe: 'classe',
      moyen: 'moyen',
      valeur: 'valeur',
      reussite: 'reussite',
      echec: 'echec',
      requete: 'requete',
      description: 'description',
    };
  }

  factory Ensegnant.fromMap(Map<String, dynamic> map) {
    return Ensegnant(
        id: map['id'],
        specialite: map['specialite'],
        moyen: map['moyen'],
        user: map['user'],
        classe: map['classe'],
        valeur: map['valeur'],
        reussite: map['reussite'],
        echec: map['echec'],
        requete: map['requete'],
        description: map['description']);
  }
  JsonEncoder toJson() => json.encoder;

  factory Ensegnant.fromJSon(String source) =>
      Ensegnant.fromMap(json.decoder as Map<String, dynamic>);
  @override
  String toString() => '''Eseingnant(  id: $id,
      specialite: $specialite,
      user:$user,
      classe:$classe,
      moyen: $moyen,
      valeur: $valeur,
      reussite: $reussite,
      echec: $echec,
      requete: $requete,
      description:$description)''';
}

class Matiere {
  // ignore: duplicate_ignore
  // ignore: non_constant_identifier_names
  String nom_matiere;
  String photo;

  Matiere(
      // ignore: duplicate_ignore
      // ignore: non_constant_identifier_names
      {required this.nom_matiere,
      required this.photo});

  factory Matiere.fromJson(Map<String, dynamic> map) {
    return Matiere(nom_matiere: map['nom_matiere'], photo: map['photo']);
  }
}

class Salle {
  int id;
  String classe;

  Salle({
    required this.id,
    required this.classe,
  });

  factory Salle.fromJSon(Map<String, dynamic> map) {
    String classe = map['classe'];
    return Salle(
      id: map['id'],
      classe: classe,
    );
  }
  JsonEncoder toJson() => json.encoder;
}

class Enseignant {
  final int id;
  // final String specialite;
  final List classe;
  final double moyen;
  final int valeur;
  // final int reussite;
  // final int echec;
  // final int requete;
  final String description;
  final String Photo;
  final String ville;
  final String quartier;
  final String username;
  final String firstname;
  final String lastname;
  final String age;
  final String email;

  Enseignant({
    required this.id,
    required this.Photo,
    required this.ville,
    required this.quartier,
    required this.firstname,
    required this.lastname,
    required this.username,
    // required this.specialite,
    required this.classe,
    required this.moyen,
    required this.valeur,
    // required this.reussite,
    // required this.echec,
    // required this.requete,
    required this.description,
    required this.age,
    required this.email,
  });

  factory Enseignant.fromJson(Map<String, dynamic> map) {
    Map User = map['User'];
    return Enseignant(
        id: map['id'],
        Photo: User['Photo'],
        firstname: User['first_name'],
        lastname: User['last_name'],
        ville: User['Ville'],
        quartier: User['Quatier'],
        age: User['Date_de_naissance'],
        // specialite: map['specialite'],
        classe: map['classe_tenue'],
        valeur: map['Valeur'],
        // reussite: map['Taux_de_reussite'],
        // echec: map['Taux_d_echec'],
        // requete: map['nombre_de_requete'],
        description: map['description'],
        moyen: map['moyenne'],
        username: User['username'],
        email: User['email']);
  }
}

class Commentaire {
  final int id;

  // final int reussite;
  // final int echec;
  // final int requete;
  final String contenue;
  final String Photo;
  final String ville;
  final String quartier;
  final String username;
  final String firstname;
  final String lastname;
  final String age;

  Commentaire(
      {required this.id,
      required this.Photo,
      required this.ville,
      required this.quartier,
      required this.firstname,
      required this.lastname,
      required this.username,
      // required this.specialite,
      // required this.classe,

      // required this.reussite,
      // required this.echec,

      // required this.requete,
      required this.contenue,
      required this.age});

  factory Commentaire.fromJson(Map<String, dynamic> map) {
    Map User = map['client'];
    return Commentaire(
      id: map['id'],
      Photo: User['Photo'],
      firstname: User['first_name'],
      lastname: User['last_name'],
      ville: User['Ville'],
      quartier: User['Quatier'],
      age: User['Date_de_naissance'],
      // specialite: map['specialite'],
      // classe: map['classe'],
      // reussite: map['Taux_de_reussite'],
      // echec: map['Taux_d_echec'],
      // requete: map['nombre_de_requete'],
      contenue: map['Contenu'],
      username: User['username'],
    );
  }
}
