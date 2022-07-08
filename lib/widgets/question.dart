import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {

  String Question;
  int count;
  QuestionWidget({Key? key,required this.Question,required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: ,
      margin: EdgeInsets.only(top: 30,left: 20,right: 20),
      child: Text("${count+1}.${Question}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

    );
  }
}
