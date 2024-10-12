
import 'package:flutter/material.dart';

class Couleurs {
  Color couleursfond = const Color.fromARGB(255, 144, 166, 255);
  Gradient couleurboutton = const LinearGradient(colors: <Color>[
    Color.fromARGB(200, 1, 101, 255),
    Color.fromARGB(200, 157, 254, 219),
  ]) as Gradient;
   Gradient couleurfonds = const  SweepGradient(colors: <Color>[
  Colors.white,
    Color.fromARGB(255, 144, 166, 255)
    , 
  ]) as Gradient;
}
