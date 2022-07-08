import 'package:flutter/material.dart';
import 'package:quizapp/widgets/question.dart';

import 'answer.dart';

class AppScreen extends StatefulWidget {
  static  String selected="nothing";
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  
  List<String> questions=["Flutter developed by?",   " Flutter is not a language; it is an SDK.",    "The first alpha version of Flutter was released in ?",  "Flutter is mainly optimized for 2D mobile apps that can run on?", "The examples of the Stateless widget are?"];
  List<List<String>> options=[
    ["Oracle","Facebook","Google","IBM"],
    ["TRUE","FALSE","Can be true or false","Can not say"],
    ["2016","2017","2018","2019"],
    ["Android","iOS"," Both A and B","None of the above"],
    ["Text","Row","Column","All of the above"],
    ["Quiz Ended","Press  ","Restart","Button"]
  ];
  int winner=0;
  List<String> correct=["Google","TRUE","2017","Both A and B","All of the above"];
  int count=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quiz"),
        backgroundColor: Colors.black,
        shadowColor: Colors.white,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          (count<5)?QuestionWidget(count: count, Question: questions[count],):Text(""),
         Spacer(),
          // SizedBox(height: 40,),
          AnswersWidget(options: (count<5)?options[count]:options[5],onpress: ()
          {

            setState(() {
              showDialog(context: context, builder: (context){return const Center(child: const CircularProgressIndicator(value: 1,color: Colors.black,),);});
            });

            if(count<5 && AppScreen.selected==correct[count]){
              Navigator.of(context).pop();
              showDialog(context: context, builder: (context)
              {return ( AlertDialog(
                title: Text("Yahoo!!Correct"),
                content: Text("Press ok to Continue"),
                actions: [
                  TextButton(onPressed: (){  Navigator.of(context).pop();  }, child: Text("ok"))
                ],
              ));});
              winner++;
              if(winner==4)
                {
                  showDialog(context: context, builder: (context)
                  {return ( AlertDialog(
                    title: Text("${winner}/5 is Correct!!"),
                    content: Text("Press ok to restart"),
                    actions: [
                      TextButton(onPressed: (){  count=0;winner=0;
                        Navigator.of(context).pop();
                        setState(() {

                      }); }, child: Text("ok"))
                    ],
                  ));});
                }

            }else if(count<5 && AppScreen.selected!=correct[count]){
              Navigator.of(context).pop();
              showDialog(context: context, builder: (context)
              {return ( AlertDialog(
                title: Text("Opps!!InCorrect"),
                content: Text("Press ok to Continue"),
                actions: [
                  TextButton(onPressed: (){  Navigator.of(context).pop();  }, child: Text("ok"))
                ],
              ));});
            }else if(count>=4){
              // Navigator.of(context).pop();
              showDialog(context: context, builder: (context)
              {return ( AlertDialog(
                title: Text("${winner}/5 is Correct!!"),
                content: Text("Press ok to restart"),
                actions: [
                  TextButton(onPressed: (){  count=0;winner=0; setState(() {

                  }); }, child: Text("ok"))
                ],
              ));});
            }
            count++;
          }


            ,),
          Spacer(),
          // SizedBox(height: 100,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed: (){
              setState(() {
                count=0;
                winner=0;
              });
              }, child: Text("Restart"),style: ElevatedButton.styleFrom(primary: Colors.black,shadowColor: Colors.white),),
              SizedBox(width: 160,),
              ElevatedButton(onPressed: (){
                setState(() {
                  count++;
                });
                if(count>=5){
                  Navigator.of(context).pop();
                  showDialog(context: context, builder: (context)
                  {return ( AlertDialog(
                    title: Text("${winner}/5 is Correct!!"),
                    content: Text("Press ok to restart"),
                    actions: [
                      TextButton(onPressed: (){  count=0;winner=0;  }, child: Text("ok"))
                    ],
                  ));});
                }
              }, child: Text("Next"),style: ElevatedButton.styleFrom(primary: Colors.black,shadowColor: Colors.white)),
              SizedBox(width: 40,)
            ],
          ),
          Spacer()

        ],
      ),
    );
  }
}
