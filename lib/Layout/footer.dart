import 'package:flutter/material.dart' ;  

class Footer extends StatelessWidget {

  final IconThemeData selectedIconThemeData = IconThemeData(
    color:Colors.blue[600]
  ) ; 

  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            title:Text('asda')
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.insert_chart),
            title:Text('asda')
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.folder),
            title:Text('asda')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title:Text('asda')
          )
        ],
        backgroundColor: new Color(0xff181930),
        selectedIconTheme: selectedIconThemeData,
        unselectedItemColor: Colors.indigo[300],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ) ;
  }
}