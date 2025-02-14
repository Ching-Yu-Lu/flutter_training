import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_firsts/taiwan_time.dart';

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

    DateTime dateTimePastMins = DateTime.now().add(const Duration(minutes: -4));
    DateTime dateTimeFutureMins =
        DateTime.now().add(const Duration(minutes: 4, seconds: 1));

    DateTime dateTimePastInHours =
        DateTime.now().add(const Duration(minutes: -50));
    DateTime dateTimeFutureInHours =
        DateTime.now().add(const Duration(minutes: 50, seconds: 1));

    DateTime dateTimePastOverHours =
        DateTime.now().add(const Duration(hours: -2));
    DateTime dateTimeFutureOverHours =
        DateTime.now().add(const Duration(hours: 2, seconds: 1));

    DateTime dateTimePastOverDays =
        DateTime.now().add(const Duration(days: -3));
    DateTime dateTimeFutureOverDays =
        DateTime.now().add(const Duration(days: 3, seconds: 1));

    DateTime dateTimePastOverWeek =
        DateTime.now().add(const Duration(days: -8));
    DateTime dateTimeFutureOverWeek =
        DateTime.now().add(const Duration(days: 8, seconds: 1));

    return MaterialApp(
      home: Scaffold(
        body: /*Center(
          //child: Text('Hello World!'),
          //child: Counter(num: 5),
          child: TaiwanTime(
              inputDateTime: DateTime(2025, 2, 14, 16, 33), showFuzzy: true),
        ), // */
            Column(
          children: [
            TaiwanTime(inputDateTime: dateTimePastMins, showFuzzy: true),
            TaiwanTime(
                inputDateTime: dateTimePastMins,
                setColors: Colors.purpleAccent,
                showFuzzy: false),
            TaiwanTime(inputDateTime: dateTimeFutureMins, showFuzzy: true),
            TaiwanTime(
                inputDateTime: dateTimeFutureMins,
                setFontSize: 50,
                showFuzzy: false),
            TaiwanTime(inputDateTime: dateTimePastInHours, showFuzzy: true),
            TaiwanTime(inputDateTime: dateTimeFutureInHours, showFuzzy: true),
            TaiwanTime(inputDateTime: dateTimePastOverHours, showFuzzy: true),
            TaiwanTime(inputDateTime: dateTimeFutureOverHours, showFuzzy: true),
            TaiwanTime(inputDateTime: dateTimePastOverDays, showFuzzy: true),
            TaiwanTime(inputDateTime: dateTimeFutureOverDays, showFuzzy: true),
            TaiwanTime(inputDateTime: dateTimePastOverWeek, showFuzzy: true),
            TaiwanTime(
                inputDateTime: dateTimeFutureOverWeek,
                setColors: Colors.teal,
                showFuzzy: true),
          ],
        ),
      ),
    );
  }
}

//fst
// shift + alt + f 程式整理

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