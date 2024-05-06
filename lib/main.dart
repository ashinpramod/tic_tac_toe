import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home_page.dart';
void main(){
  runApp(TicTacToe());
}

class TicTacToe extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Homepage() ,
   );
  }

}


