import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    /*int intValue = 123;
    DateTime dateTimeValue = DateTime.parse('2025-12-01 23:59:59');

    print('intValue: ${intValue.toString()}, dateTimeValue: ${dateTimeValue.hour}');// */

    return const MaterialApp(
      home: Scaffold(
        body: Center(
          //child: Text('Hello World!'),
          child: Counter(num: 5),
        ),
      ),
    );
  }
}

// shift + alt + f 程式整理
// snippet
/*class BigBlueText extends StatelessWidget {
  final String text;
  final Color color;
  const BigBlueText({super.key, required this.text, this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Text('$text A', style: TextStyle(color: ));
  }
}*/

class Counter extends StatefulWidget {
  final int num;
  const Counter({super.key, this.num = 0});

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int localNum = 0;
  final int fontSize = 64;

  @override
  void initState() {
    super.initState();
    localNum = widget.num;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          localNum.toString(),
          style: TextStyle(
            fontSize: fontSize.toDouble(),
            fontWeight: FontWeight.bold,
            color: localNum >= 0
                ? localNum >= 10
                    ? Colors.blue
                    : Colors.green
                : Colors.red,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    localNum++;
                  });
                },
                icon: Icon(
                  Icons.add,
                  size: 50,
                )),
            //Spacer(), // 左右撐開
            IconButton(
                onPressed: () {
                  setState(() {
                    localNum--;
                  });
                },
                icon: Icon(Icons.remove))
          ],
        )
      ],
    );
  }
}


/*
/// three add
class ThreeCounters extends StatefulWidget {
  const ThreeCounters({Key? key}) : super(key: key);

  @override
  _ThreeCountersState createState() => _ThreeCountersState();
}

class _ThreeCountersState extends State<ThreeCounters> {
  List<int> SumArr = [0, 0, 0];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Counter(
          num: 0,
          onCounterChanged: (value) {
            setState(() {
              SumArr[0] = value;
            });
          },
        ),
        Counter(
          num: 0,
          onCounterChanged: (value) {
            setState(() {
              SumArr[1] = value;
            });
          },
        ),
        Counter(num: 0, onCounterChanged: (value) {
          setState(() {
            SumArr[2] = value;
          });
        }, Text('Total: $SumArr')),
      ],
    );
  }
}
*/