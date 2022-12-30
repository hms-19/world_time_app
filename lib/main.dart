import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loader.dart';
import 'package:world_time_app/pages/choose_country.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/loader',
    routes: {
      '/home' :(context) => Home(),
      '/loader' :(context) => Loader(),
      '/choose_country' :(context) => ChooseCountry()
    },
  ));
}
