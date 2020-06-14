import 'package:flutter/material.dart' ; 
import 'footer.dart' ; 
import 'body.dart' ; 

class Layout extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(), 
      bottomNavigationBar: Footer(),
      backgroundColor: new Color(0xff181930)
    ) ;
  }

}