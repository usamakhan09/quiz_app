import 'package:flutter/material.dart';
import 'package:quizapp/widgets/app_screen.dart';

class AnswersWidget extends StatelessWidget {
  //
  Function? onpress;
  List<String> options;
   AnswersWidget({Key? key,required,required this.options,required this.onpress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(onPressed:(){AppScreen.selected=options[0];
            onpress!();}, child:  Text("A. ${options[0]}",style: TextStyle(color: Colors.black,fontSize:20,fontWeight: FontWeight.w500 ),),style:  TextButton.styleFrom(primary: Colors.black),),
          TextButton(onPressed: (){AppScreen.selected = options[1];
          onpress!();}, child:Text("B. ${options[1]}" ,style: TextStyle(color: Colors.black,fontSize:20,fontWeight: FontWeight.w500 ),),style:  TextButton.styleFrom(primary: Colors.black),),
          TextButton(onPressed: (){AppScreen.selected = options[2];
          onpress!();}, child: Text("C. ${options[2]}",style: TextStyle(color: Colors.black,fontSize:20,fontWeight: FontWeight.w500 ),),style:  TextButton.styleFrom(primary: Colors.black),),
          TextButton(onPressed: (){AppScreen.selected = options[3];
          onpress!();}, child:  Text("D. ${options[3]}",style: TextStyle(color: Colors.black,fontSize:20,fontWeight: FontWeight.w500 ),),style:  TextButton.styleFrom(primary: Colors.black),),
        ],
      ),
    );
  }
}
