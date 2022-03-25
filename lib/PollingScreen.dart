import 'package:flutter/material.dart';
import 'package:my_app/StartScreen.dart';
import 'package:my_app/variables.dart';
import 'package:my_app/funcs.dart';

class PollingScreen extends StatefulWidget {
  @override
  _PollingScreenState createState() => _PollingScreenState();
}

class _PollingScreenState extends State<PollingScreen> {
  int counter = 1;
  Map AnswerList = {};

  double Covid_points = 0;
  double Cold_points = 0;
  double Flu_points = 0;

  @override
  Widget build(BuildContext context) {
    double FontSizeScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
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

      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  textMap["PleaseAnswerQuestions"],
                  style: TextStyle(color: Colors.white, fontSize: 20/FontSizeScale),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/images/app_logo_empty.png",
                      scale: 1.2,
                    ),

                    // Text(
                    //   "$counter/20",
                    //   style: TextStyle(fontSize: 25/FontSizeScale, color: Colors.white),
                    // ),

                    RichText(text: TextSpan(
                        style: TextStyle(fontSize: 25/FontSizeScale, color: Colors.white),
                        children: [
                          TextSpan(text: counter.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: "/20"),
                        ]
                    ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ] +
              QuestionAndAnswers(textMap[Questions[counter - 1]]),
        ),
      ),
    );
  }

  List<Widget> QuestionAndAnswers(String question) {

    double FontSizeScale = MediaQuery.of(context).textScaleFactor;

    List<Widget> ans_buttons_list = [];

    List ans_list = [];

    List answer_names = [];
    if (counter == 1) {
      ans_list = textMap["genders_ans"];
      answer_names = Answers["genders_ans"];
    }
    else if(counter == 2) {
      ans_list = textMap["ages_ans"];
      answer_names = Answers["ages_ans"];
    }
    else {
      ans_list = textMap["yes_no_ans"];
      answer_names = Answers["yes_no_ans"];
    }

    ans_list.forEach((ans) {
      ans_buttons_list.add(ElevatedButton(
          style: ElevatedButton.styleFrom(
              shadowColor: Colors.black, fixedSize: Size(120, 10),
              primary: Colors.green),
          onPressed: () {
            setState(() {
              var quest = Questions[counter-1];
              var selected_ans = answer_names[ans_list.indexOf(ans)];
              AnswerList.addAll({quest : selected_ans});
              // print("$quest : $selected_ans");
              if (counter < 20) {
                counter++;
              }
              else{
                print(AnswerList);
                Result = defResult(AnswerList);
                print("result:");
                print(Result);
                if (Result["covid"]==0 && Result["cold"]==0 && Result["flu"]==0){
                  RecommendsText = textMap["RecommendsText_5"];
                }
                else if(Result["covid"]<30){
                  RecommendsText = textMap["RecommendsText_1"];
                }
                else if(Result["covid"]>=30 && Result["covid"]<40){
                  RecommendsText = textMap["RecommendsText_2"];
                }
                else if(Result["covid"]>=40 && Result["covid"]<50){
                  RecommendsText = textMap["RecommendsText_3"];
                }
                else if(Result["covid"]>=50){
                  RecommendsText = textMap["RecommendsText_4"];
                }
                // else{
                //   RecommendsText = textMap["RecommendsText_5"];
                // }
                trySend(AnswerList, Result);
                Navigator.restorablePushNamedAndRemoveUntil(context, '/result', (route)=>false);
              }
            });
          },
          child:
              Text(ans, style: TextStyle(fontSize: 16/FontSizeScale, color: Colors.white))));
      // if(answers.last!=ans){
      //   ans_buttons_list.add(SizedBox(width: 80));
      // }
    });

    Widget ans_row() {
      if (ans_buttons_list.length == 2) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: ans_buttons_list,
        );
      } else {
        return Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ans_buttons_list.getRange(0, 3).toList()),
            SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ans_buttons_list.getRange(3, 5).toList())
          ],
        );
      }
    }

    if (counter > 3 && counter < 20) {
      question = textMap["DoYouHaveFollowingSymptoms"] + "\n\n" + question;
    } else {
      question = "\n" + question;
    }

    var list = [
      SizedBox(
        height: 120,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 60.0),
          child: Text(
            question,
            style: TextStyle(
                fontSize: 18/FontSizeScale, color: Colors.white, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          ),
        ),
      ),


      SizedBox(
        height: 120, //fixed
        child: ans_row(),
      ),

      SizedBox(
        height: 10,
      ),

      ElevatedButton(
          style: ElevatedButton.styleFrom(
              shadowColor: Colors.black, fixedSize: Size(200, 10), primary: Colors.red),
          onPressed: () => Navigator.pushNamed(context, '/start'),
          child: Text(textMap["Stop"], style: TextStyle(fontSize: 18/FontSizeScale, color: Colors.white)))
    ];
    return list;
  }
}
