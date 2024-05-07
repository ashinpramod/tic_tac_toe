import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Homepage()));
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> viewTap = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  bool firstTurn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: GridView.builder(
          itemCount: 9,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _pressed(index);
              },
              child: Container(
                  decoration: BoxDecoration(border: Border.all()),
                  child: Center(
                      child: Text(
                    viewTap[index],
                    //index.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ))),
            );
          }),
    );
  }

  void _pressed(int index) {
    setState(() {
      // viewTap[index]="O";
      if (firstTurn) {
        viewTap[index] = "X";
      } else {
        viewTap[index] = "O";
        firstTurn = !firstTurn;
        _checkWin();
      }
    });
  }

  void _checkWin() {
    if (viewTap[0] == viewTap[1] &&
        viewTap[0] == viewTap[2] &&
        viewTap[0] != '') {
      _showMessage(viewTap[0]);
    }
    if (viewTap[3] == viewTap[4] &&
        viewTap[3] == viewTap[5] &&
        viewTap[3] != "") {
      _showMessage(viewTap[3]);
    }
    if (viewTap[6] == viewTap[7] && viewTap[6] == viewTap[8] && viewTap != "") {
      _showMessage(viewTap[6]);
    }
    if (viewTap[0] == viewTap[3] && viewTap[0] == viewTap[6] && viewTap != "") {
      _showMessage(viewTap[0]);
    }
    if (viewTap[1] == viewTap[4] && viewTap[1] == viewTap[7] && viewTap != '') {
      _showMessage(viewTap[1]);
    }
    if (viewTap[2] == viewTap[5] && viewTap[1] == viewTap[8] && viewTap != '') {
      _showMessage(viewTap[2]);
    }
    if (viewTap[0] == viewTap[4] && viewTap[0] == viewTap[8] && viewTap != '') {
      _showMessage(viewTap[0]);
      if (viewTap[2] == viewTap[4] &&
          viewTap[2] == viewTap[6] &&
          viewTap != '') {
        _showMessage(context);
      }
    }
  }
}

void _showMessage(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Won"),
        );
      });
}
