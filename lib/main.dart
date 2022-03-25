import 'package:flutter/material.dart';
import 'package:my_app/LangScreen.dart';
import 'package:my_app/StartScreen.dart';
import 'package:my_app/AboutAppScreen.dart';
import 'package:my_app/PollingScreen.dart';
import 'package:my_app/Terms.dart';
import 'package:my_app/ResultScreen.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/lang',
  routes: {
    '/lang' : (context) => LangScreen(),
    '/start' : (context) => StartScreen(),
    '/about_app' : (context) => AboutAppScreen(),
    '/terms' : (context) => Terms(),
    '/polling' : (context) => PollingScreen(),
    '/result' : (context) => ResultScreen(),
  },
));