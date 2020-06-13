import 'package:flutter/material.dart' ;
import 'package:carousel_slider/carousel_slider.dart' ; 

class CardNameAndBalance extends StatelessWidget {

  CardNameAndBalance({@required this.name, @required this.balance}) ; 

  final String name; 
  final String balance ; 

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '${name.toUpperCase()}',
          style:TextStyle(
            color:Colors.indigo[300],
            fontSize:12,
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
            fontFamily:'quicksand',
          )
        ),
        Container(
          margin: EdgeInsets.only(top:10),
          child:Text(
            '$balance  ',
            style:TextStyle(
              color:Colors.white,
              fontSize:23,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
              fontFamily:'quicksand',
            )
          )
        )
      ],
    ) ; 
  }
}


class CardDetails extends StatelessWidget {

  CardDetails({@required this.last4}) ; 

  final String last4; 

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                child:Text(
                  '**** **** $last4 ',
                  style:TextStyle(
                    fontFamily:'quicksand',
                    letterSpacing: 1,
                    color:Colors.white,
                    fontSize:15,
                    fontWeight: FontWeight.w900
                  )
                ),
                alignment: Alignment.centerRight,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:<Container>[
                  Container(
                    margin:EdgeInsets.only(top:10),
                    padding:EdgeInsets.symmetric(vertical: 3,horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color:Colors.blue[300]
                    ),
                    child:Text(
                      'ACTIVE',
                      style:TextStyle(
                        fontFamily:'quicksand',
                        color:Colors.white,
                        fontSize:10,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  )
                ]
              ),
            ],
          )
        )
      ],
    ) ; 
  }
}


class Card extends StatelessWidget {
  Card({@required this.balance, @required this.name, @required this.last4}) ; 

  final String balance ; 
  final String name ; 
  final String last4 ; 

  Widget build(BuildContext context) {
    return Container(
        height:100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
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
        padding:EdgeInsets.all(20), 
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child:CardDetails(last4: last4),
              flex:1
            ),
            Expanded(
              child:CardNameAndBalance(name: name,balance: balance),
              flex:1,
            )
            
          ],
        )
      );
  }
}

class Cards extends StatelessWidget {

  static CarouselOptions options = CarouselOptions(
      initialPage: 0,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
  ) ; 

  List<Map<String,String>> cards = [
    {'name':'etherum','last4':'4342','balance':'1,032 ETH'},
    {'name':'bitcoin','last4':'2589','balance':'33,032 BTC'}, 
    {'name':'Flaka','last4':'3053','balance':'100,932 FLK'}
  ] ; 

  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.fromLTRB(0, 40, 0, 40),
      child:CarouselSlider(
        options:options,
        carouselController: CarouselController(),
        items: cards.map((item) {
          return Builder(
            builder:(BuildContext context) {
              return Container(
                child:Card(name: item['name'],last4:item['last4'], balance: item['balance'])
              ) ;
            },
          ) ; 
        }).toList(),
      )
    ) ; 
  }
}