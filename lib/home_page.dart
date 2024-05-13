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
  bool firstTurn = true;
  String firstPlayer = "X";
  late List<String> viewTap;
  int boxfill = 0;

  @override
  void initState() {
    initializeGame();
    super.initState();
  }

  void initializeGame() {
    viewTap = [
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Tic Tac Toe",
          style: TextStyle(
              fontSize: 30, color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
            itemCount: 9,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  _pressed(index);
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: viewTap[index].isEmpty
                            ? Colors.grey
                            : viewTap[index] == firstPlayer
                                ? Colors.red
                                : Colors.green,
                        border: Border.all(),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 10,
                              spreadRadius: 1.0)
                        ]),
                    child: Center(
                        child: Text(
                      viewTap[index],
                      //index.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ))),
              );
            }),
      ),
    );
  }

  void _pressed(int index) {
    setState(() {
      // viewTap[index]="O";
      if (firstTurn && viewTap[index] == "") {
        //for no tap change //first turn and there is nothing
        viewTap[index] = "X";
        boxfill = boxfill + 1;
      } else if (!firstTurn && viewTap[index] == "") {
        viewTap[index] = "O";
        boxfill = boxfill + 1;
      }
      firstTurn = !firstTurn; //O / X
      _checkWin();
    });
  }

  void _checkWin() {
    if (viewTap[0] == viewTap[1] &&
        viewTap[0] == viewTap[2] &&
        viewTap[0] != '') {
      _showMessage(context, viewTap[0]);
    }
    if (viewTap[3] == viewTap[4] &&
        viewTap[3] == viewTap[5] &&
        viewTap[3] != "") {
      _showMessage(context, viewTap[3]);
    }
    if (viewTap[6] == viewTap[7] &&
        viewTap[6] == viewTap[8] &&
        viewTap[6] != "") {
      _showMessage(context, viewTap[6]);
    }
    if (viewTap[0] == viewTap[3] &&
        viewTap[0] == viewTap[6] &&
        viewTap[0] != "") {
      _showMessage(context, viewTap[0]);
    }
    if (viewTap[1] == viewTap[4] &&
        viewTap[1] == viewTap[7] &&
        viewTap[1] != '') {
      _showMessage(context, viewTap[1]);
    }
    if (viewTap[2] == viewTap[5] &&
        viewTap[2] == viewTap[8] &&
        viewTap[2] != '') {
      _showMessage(context, viewTap[2]);
    }

    if (viewTap[0] == viewTap[4] &&
        viewTap[0] == viewTap[8] &&
        viewTap[0] != '') {
      _showMessage(context, viewTap[0]);
    } else if (boxfill == 9) {
      _showDrawMessage(context);
    }
    if (viewTap[6] == viewTap[4] &&
        viewTap[6] == viewTap[2] &&
        viewTap[6] != '') {
      _showMessage(context, viewTap[6]);
    }
  }

  void _showDrawMessage(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Homepage()));
                  },
                  child: Text("Play again"))
            ],
            backgroundColor: Color(0xFFC8E6C9),
            title: Text(
              "  Game over ! Match Draw",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        });
  }

  void _showMessage(context, String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Homepage()));
                  },
                  child: Text("Play again"))
            ],
            backgroundColor: Color(0xFFC8E6C9),
            title: Text(
              "   The Winner is  " + winner,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
