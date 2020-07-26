import 'package:flutter/material.dart';
import 'package:worl_time/Pages/home.dart';
import 'package:worl_time/Pages/loading.dart';
import 'package:worl_time/Pages/choising_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChoosingLocation(),
    },
  ));
}
