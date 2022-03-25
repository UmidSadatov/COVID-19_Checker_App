import 'package:flutter/material.dart';
import 'package:my_app/variables.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double FontSizeScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
        backgroundColor: Colors.grey[900],

        // appBar: AppBar(
        //   title: const Text(
        //    "     COVID-19 Checker    ",
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

        body: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.0,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                textMap["AboutAppTitle"],
                style: TextStyle(
                    fontSize: 25/FontSizeScale,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                textMap["AboutAppText"],
                style: TextStyle(fontSize: 16/FontSizeScale, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            ElevatedButton(
                onPressed: () => Navigator.popAndPushNamed(context, '/start'),
                child: Text("OK"),
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.black, fixedSize: Size(120, 10),
                  primary: Colors.green),
            ),
          ],
        )
    );
  }
}
