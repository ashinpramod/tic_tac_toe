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
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      backgroundColor: Colors.white,
      body: GridView.builder(
          itemCount: 9,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return Container(decoration: BoxDecoration(border: Border.all()),
                child: Center(
                    child: Text(
              index.toString(),
              style: TextStyle(color: Colors.black, fontSize: 30),
            )));
          }),
    );
  }
}
