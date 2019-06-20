import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dice The Game'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int leftPoints = 0;
  int rightPoints = 0;
  int draws = 0;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;

      if (leftDiceNumber > rightDiceNumber) {
        leftPoints++;
      } else if (leftDiceNumber < rightDiceNumber) {
        rightPoints++;
      } else {
        draws++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Text(
              'Toque nos dados para jogar!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white, 
                fontSize: 25.0),
            ),
          ),
          width: double.infinity,
          height: 100.0,
        ),
        Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    changeDiceFace();
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    changeDiceFace();
                  },
                  child: Image.asset('images/dice$rightDiceNumber.png'),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Player 1 Score: $leftPoints',
            style: TextStyle(color: Colors.red.shade900, fontSize: 30.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Player 2 Score: $rightPoints',
            style: TextStyle(color: Colors.red.shade900, fontSize: 30.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Empates: $draws',
            style: TextStyle(color: Colors.red.shade900, fontSize: 30.0),
          ),
        ),
      ],
    );
  }
}
