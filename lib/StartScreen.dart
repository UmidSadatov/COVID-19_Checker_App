import 'package:flutter/material.dart';
import 'package:my_app/variables.dart';
import 'package:my_app/AboutAppScreen.dart';
import 'package:my_app/Terms.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double FontSizeScale = MediaQuery.of(context).textScaleFactor;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],

        // appBar: AppBar(
        //   title: const Text(
        //     "     COVID-19 Checker    ",
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
              const SizedBox(height: 150.0),
              Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      print("\"Start\" image was pressed");
                      // Navigator.restorablePushNamedAndRemoveUntil(context, '/polling', (route) => false);
                      Navigator.pushNamed(context, '/terms');
                    },
                    iconSize: 200,
                    icon: Image.asset("assets/images/app_logo_start.png"),
                  ),
                  TextButton(
                    onPressed: () {
                      print("\"Start\" text-button was pressed");
                      // Navigator.restorablePushNamedAndRemoveUntil(context, '/polling', (route) => false);
                      Navigator.pushNamed(context, '/terms');
                    },
                    child: Text(
                      textMap["Start"],
                      style: TextStyle(fontSize: 12.0/FontSizeScale, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100.0),

              // TextButton.icon(
              //     // style: ElevatedButton.styleFrom(
              //     //     shadowColor: Colors.black, primary: Colors.black),
              //     onPressed: (){
              //       print("\"Start\" was pressed");
              //       Navigator.pushNamed(context, '/terms');
              //     },
              //     icon: Image.asset("assets/images/app_logo_start.png", scale: 3,),
              //     label: Text(
              //       textMap["Start"],
              //       style: const TextStyle(
              //         fontWeight: FontWeight.bold,
              //         // decoration: TextDecoration.underline,
              //         color: Colors.lightGreenAccent,
              //         fontSize: 50.0/FontSizeScale,
              //       ),
              //     )),

              TextButton.icon(
                  onPressed: (){
                    print("\"About App\" was pressed");
                    Navigator.pushNamed(context, '/about_app');
                    },
                  icon: const Icon(
                    Icons.help_outline_rounded,
                    size: 25.0,
                    color: Colors.white,
                  ),
                  label: Text(
                    textMap["AboutApp"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontSize: 25.0/FontSizeScale,
                    ),
                  )),

              const SizedBox(height: 50.0),

              TextButton.icon(
                  onPressed: () {
                    print("\"Change language\" was pressed");
                    Navigator.pushNamed(context, '/lang');
                  },
                  icon: const Icon(Icons.language,
                      size: 18.0, color: Colors.white),
                  label: Text(
                    textMap["ChangeLang"],
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      // fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontSize: 18.0/FontSizeScale,
                    ),
                  )),
            ],
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
