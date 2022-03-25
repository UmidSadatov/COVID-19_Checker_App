import 'package:flutter/material.dart';
import 'package:my_app/variables.dart';

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  var ButtonState = null;
  bool? checkBoxValue = false;

  setButtonState() {
    if (checkBoxValue==false){
      ButtonState = null;
    }
    else{
      ButtonState =  () => Navigator.pushNamedAndRemoveUntil(context, '/polling', (route)=>false);
    }
  }

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

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 40.0,
            // ),
            Align(
              alignment: Alignment.center,
              child: Text(
                textMap["TermsTitle"],
                style: TextStyle(
                    fontSize: 25/FontSizeScale,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            // SizedBox(
            //   height: 30.0,
            // ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 30),
                Icon(Icons.circle, size: 16.0, color: Colors.lightGreenAccent),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    // height: 100,
                    child: Text(
                      textMap["TermsText_1"],
                      style: TextStyle(
                          fontSize: 16/FontSizeScale,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 30),
                Icon(Icons.circle, size: 16.0, color: Colors.lightGreenAccent),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    // height: 100,
                    child: Text(
                      textMap["TermsText_2"],
                      style: TextStyle(
                          fontSize: 16/FontSizeScale,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 30),
                Icon(Icons.circle, size: 16.0, color: Colors.lightGreenAccent),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    // height: 100,
                    child: Text(
                      textMap["TermsText_3"],
                      style: TextStyle(
                          fontSize: 16/FontSizeScale,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
            ),

            Align(
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: checkBoxValue,
                    onChanged: (bool? value) {
                      setState(() {
                        checkBoxValue = value;
                        setButtonState();
                      }
                      );
                    },

                    activeColor: Colors.lightGreenAccent,
                    checkColor: Colors.black,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        checkBoxValue = !checkBoxValue!;
                        setButtonState();
                      });
                    },
                    child: Text(
                      textMap["ReadAndAccept"],
                      style: TextStyle(fontSize: 16.0/FontSizeScale, color: Colors.white),
                    ),
                  )
                  // Text(textMap["ReadAndAccept"], style: TextStyle(fontSize: 16/FontSizeScale, color: Colors.white),),
                ],
              ),
            ),



            ElevatedButton(
              // onPressed: () => Navigator.popAndPushNamed(context, '/start'),
              onPressed: ButtonState,
              style: ElevatedButton.styleFrom(
                onSurface: Colors.white,
                primary: Colors.green
              ),
              child: Text(textMap["Start"]),
            ),
          ],
        ));
  }
}
