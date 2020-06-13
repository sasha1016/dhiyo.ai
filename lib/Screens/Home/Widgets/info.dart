import 'dart:ffi';

import 'package:flutter/material.dart' ; 
import '../../../Constants/index.dart' ; 

final Map<String,dynamic> crossAxisCounts = {
  'MB':{
    'S':{'PT':1,'LS':1},
    'M':{'PT':2,'LS':3},
    'L':{'PT':2,'LS':3}
  },
  'TB':{
    'S':{'PT':3,'LS':4},
    'L':{'PT':4,'LS':4}
  },
  'DT':5
} ;

class InfoCard extends StatelessWidget {
  InfoCard({@required this.title, @required this.value}) ;

  final String title ;
  final String value ; 

  @override
  Widget build(BuildContext context) {

    return Container(
      height:200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: new LinearGradient(
          colors: [
            const Color(0xFF181930),
            const Color(0xFF242848),
          ],
          begin: const FractionalOffset(0.0, 1.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp
        ),
      ),
      child:Container(
        padding:EdgeInsets.all(15),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child:Icon(Icons.attach_money,color: Colors.indigo[300],size:30)  
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:<Widget>[
                Container(
                  child:Text(
                    '${title.toUpperCase()}',
                    textAlign:TextAlign.left ,
                    style:TextStyle(fontFamily:'quicksand',color:Colors.indigo[300],fontSize:12,fontWeight: FontWeight.w600,letterSpacing: 1)
                  ),
                  margin:EdgeInsets.only(bottom:10)
                ),
                Text(
                  '${value.toUpperCase()}',
                  textAlign:TextAlign.left ,
                  style:TextStyle(fontFamily:'quicksand',color:Colors.white,fontSize:23,fontWeight: FontWeight.w700,letterSpacing: 0)
                )
              ]
            )
          ],
        )
      )
    ) ; 
  }
}

class CardInfo extends StatelessWidget {

  _determineAxisCount(context,orientation) {
    final screenSize = MediaQuery.of(context).size.width;

    if(
      screenSize <= screenBreakpoints['MOBILE']['BREAKPOINT'] // For Mobile Phones 
    ) { 
      final Map mobile = screenBreakpoints['MOBILE'] ; 
      if(screenSize <= mobile['S']) { // For Small Phones
        return (
          orientation == Orientation.portrait ? 
          crossAxisCounts['MB']['S']['PT'] as Float : 
          crossAxisCounts['MB']['S']['LS'] as Float
        ) ; 
      } 
      else if(screenSize <= mobile['M']) { // For medium phones
        return (
          orientation == Orientation.portrait ? 
          (crossAxisCounts['MB']['M']['PT']) :
          crossAxisCounts['MB']['M']['LS']
        ) ; 
      } else { // For Large Phones
        print('lg phone') ; 
        return (
          orientation == Orientation.portrait ? 
          crossAxisCounts['MB']['L']['PT'] :
          crossAxisCounts['MB']['L']['LS'] 
        ) ; 
      }
    }
    else if (
      screenSize <= screenBreakpoints['TAB']['BREAKPOINT'] // Tabs handler 
    ) { 
      final Map tab = screenBreakpoints['TAB'] ; 
      if(screenSize <= tab['S']) { // For Small Tabs
        return (
          orientation == Orientation.portrait ? 
          crossAxisCounts['TB']['S']['PT'] : 
          crossAxisCounts['TB']['S']['LS'] 
        ) ; 
      } else { // For Large Tabs
        return (
          orientation == Orientation.portrait ? 
          crossAxisCounts['TB']['L']['PT'] :
          crossAxisCounts['TB']['L']['LS'] 
        ) ; 
      }
    } else {
      return crossAxisCounts['DT'] ; 
    }
  }

  _determineAspectRatio(count) {
    if(count == 1) return 1.6 ; 
    if(count == 2) return 0.83 ; 
    if(count == 3) return 0.89 ; 
  }

  Widget build(BuildContext context) {

    return OrientationBuilder(
      builder:(context,orientation) {

        List<Map<String,String>> items = [
          {'title': 'Invested','value':'\$ 6000'},{'title': 'Returns','value':'\$ 100'},
          {'title': 'Invested','value':'\$ 900'},{'title': 'Returns','value':'\$ 400'}
        ] ; 
        
        final crossAxisCount = _determineAxisCount(context, orientation) ;
        final double aspectRatio = _determineAspectRatio(crossAxisCount) ; 
        return Container(
          padding:EdgeInsets.fromLTRB(30, 0, 30, 0),
          child:GridView.count(
            crossAxisCount: crossAxisCount,
            childAspectRatio: aspectRatio,
            shrinkWrap: true,   
            physics: ClampingScrollPhysics(), 
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 15.0,
            children: items.map((item) {
              return InfoCard(title:item['title'] , value:item['value']) ; 
            }).toList(),
          ) 
        ) ; 
      }
    ) ; 



    // return Container(
    //   height:150,
    //   padding:EdgeInsets.symmetric(horizontal: 30,vertical: 0),
    //   child:Row(
    //     children:<Widget>[
    //       Expanded(
    //         child:Card()
    //       ),
    //       Expanded(
    //         child:Card()
    //       )
    //     ]
    //   )
    // ) ;
  }
}