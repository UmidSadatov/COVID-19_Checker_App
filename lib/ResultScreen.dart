import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/variables.dart';
import 'package:my_app/funcs.dart';
import 'package:url_launcher/url_launcher.dart';


class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double FontSizeScale = MediaQuery.of(context).textScaleFactor;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],

        appBar: AppBar(
          title: RichText(
            text: TextSpan(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20/FontSizeScale),
                children: [
                  WidgetSpan(child: Image.asset(
                      "assets/images/app_logo.png", scale: 4.5),
                      alignment: PlaceholderAlignment.middle),
                  TextSpan(text: "    COVID-19 Checker")
                ]
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[800],
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Center(child: Text(textMap["Results"], style: TextStyle(fontSize: 25/FontSizeScale,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),),),
              SizedBox(height: 40,),

              SizedBox(
                width: 350,
                height: 250,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(textMap["covid_risk"],
                          style: TextStyle(fontSize: 20/FontSizeScale, color: Colors.white),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 15,
                            width: (300*Result["covid"].toDouble())/100,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                border: Border.all(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(10))
                        ),
                        SizedBox(width: 10,),
                        Text(Result['covid'].toString()+"%", style: TextStyle(fontSize: 20/FontSizeScale, color: Colors.white),),
                      ],
                    ),
                    SizedBox(height: 20,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(textMap["cold_risk"],
                          style: TextStyle(fontSize: 20/FontSizeScale, color: Colors.white),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 15,
                            width: 300*Result["cold"].toDouble()/100,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                border: Border.all(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(10))
                        ),
                        SizedBox(width: 10,),
                        Text(Result['cold'].toString()+"%", style: TextStyle(fontSize: 20/FontSizeScale, color: Colors.white),),
                      ],
                    ),
                    SizedBox(height: 20,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(textMap["flu_risk"],
                          style: TextStyle(fontSize: 20/FontSizeScale, color: Colors.white),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 15,
                            width: 300*Result["flu"].toDouble()/100,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                border: Border.all(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.circular(10))
                        ),
                        SizedBox(width: 10,),
                        Text(Result['flu'].toString()+"%", style: TextStyle(fontSize: 20/FontSizeScale, color: Colors.white),),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),

              Center(child: Text(textMap["Recommends"], style: TextStyle(fontSize: 20/FontSizeScale,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),),),

              SizedBox(height: 20,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  RecommendsText,
                  style: TextStyle(fontSize: 16/FontSizeScale, color: Colors.white),
                ),
              ),

              SizedBox(height: 50,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black, fixedSize: Size(120, 10),
                          primary: Colors.green,
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/start'),
                      child: Text(textMap["Back"], style: TextStyle(fontSize: 16/FontSizeScale, color: Colors.white),)),

                  SizedBox(width: 30,),

                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black, fixedSize: Size(130, 10), primary: Colors.lightGreenAccent),
                      onPressed: () async {
                        try{
                          await launch('tel://1003');
                        }
                        catch(err){print(err);}
                      },
                      icon: const Icon(Icons.call_rounded, size: 25.0, color: Colors.black),
                      label: Text("1003", style: TextStyle(fontSize: 20/FontSizeScale, color: Colors.black, fontWeight: FontWeight.bold),))
                ],
              ),

              SizedBox(height: 50,),
            ],
          ),
        ),

      ),
    );
  }
}