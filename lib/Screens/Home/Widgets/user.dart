import 'package:flutter/material.dart' ; 
import '../../../Constants/index.dart' ; 

class Info extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex:1,
          child:Container(
            child:Align(
              alignment:Alignment.bottomLeft,
              child:Text(
                'Welcome back, Shashank!',
                style:TextStyle(
                  color:Colors.indigo[300],
                  fontSize:14,
                  fontWeight: FontWeight.w500,
                  fontFamily:'quicksand'
                )
              )
            )
          )
        ),

        Expanded(
          flex:1,
          child:Container(
            margin:EdgeInsets.fromLTRB(0, 5, 0, 0),
            child:Align(
              alignment:Alignment.topLeft,
              child:Text(
                'Crypto Wallet',
                style:TextStyle(
                  color:Colors.white,
                  fontSize:25,
                  fontWeight: FontWeight.bold,
                  fontFamily:'quicksand',
                )
                )
            )
          )
        ),

      ],
    ) ;
  }
}

class UserLayoutForSmallDevices extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget>[
        Expanded(
          child:CircleAvatar(
            radius:100
          ),
        ),
        Expanded(
          child: Info()
        )
      ]
    ) ;  
  }
}

class UserLayoutForLargerDevices extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:<Widget>[
        Expanded(
          flex:7,
          child: Info()
        ),
        Expanded(
          flex:3,
          child:CircleAvatar(
            radius:100
          ),
        )
      ]
    ) ;  
  }
}

class User extends StatelessWidget {

  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder:(context,orientation) {

        final screenWidth = MediaQuery.of(context).size.width ; 
        final Widget userInfo = screenWidth <= screenBreakpoints['MOBILE']['S'] ? 
                                UserLayoutForSmallDevices() : 
                                UserLayoutForLargerDevices() ; 
        return Container(
          height:100,
          padding:EdgeInsets.symmetric(vertical: 0,horizontal:30) ,
          width:MediaQuery.of(context).size.width,
          child:userInfo
        );
      }
    ) ; 
  }
}