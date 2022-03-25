import 'package:flutter/material.dart';
import 'package:my_app/StartScreen.dart';
import 'package:my_app/variables.dart';
import 'package:my_app/funcs.dart';

class LangScreen extends StatelessWidget {
  const LangScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double FontSizeScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Colors.grey[900],

      // appBar: AppBar(
      //   title: const Text(
      //     "COVID-19 Checker",
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.grey[800],
      // ),

      appBar: AppBar(
        title: RichText(
          text: TextSpan(
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25/FontSizeScale),
              children: [
                WidgetSpan(child: Image.asset("assets/images/app_logo.png", scale: 4.5),
                    alignment: PlaceholderAlignment.middle),
                TextSpan(text: "    COVID-19 Checker")
              ]
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),

      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Tilni tanlang:\nВыберите язык:\nSelect language:",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20/FontSizeScale,
                  letterSpacing: 2),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: Text(" 🇺🇿 O'zbek    ", style: TextStyle(fontSize: 20.0/FontSizeScale),),
              onPressed: () {
                print("O'zbek");
                Lang = "uz";
                textMap = getTextMap(Lang);
                Navigator.pushNamed(context, '/start');
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text(" 🇷🇺 Русский", style: TextStyle(fontSize: 20.0/FontSizeScale),),
                onPressed: () {
                  print("Русский");
                  Lang = "ru";
                  textMap = getTextMap(Lang);
                  Navigator.pushNamed(context, '/start');
                }),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text(" 🇬🇧 English   ", style: TextStyle(fontSize: 20.0/FontSizeScale),),
                onPressed: () {
                  print("English");
                  print("device font size: "+MediaQuery.of(context).textScaleFactor.toString());
                  print("device width: "+MediaQuery.of(context).size.width.toString());
                  Lang = "en";
                  textMap = getTextMap(Lang);
                  Navigator.pushNamed(context, '/start');
                }),
            SizedBox(
              height: 3,
            ),
            Text("Version 1.0.1", style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 16/FontSizeScale),)
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
