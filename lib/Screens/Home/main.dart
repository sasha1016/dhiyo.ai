import 'package:flutter/material.dart' ;  
import 'Widgets/cards.dart' ; 
import 'Widgets/info.dart';
import 'Widgets/user.dart' ; 

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
        padding: EdgeInsets.symmetric(horizontal: 0,vertical: 40),
        child:Column(
          children:<Widget>[
            User(),
            Cards(),
            CardInfo(),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        )
      )
    ) ; 
  }
}