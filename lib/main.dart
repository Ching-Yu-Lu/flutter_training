import 'package:flutter/material.dart';
import 'package:flutter_firsts/widgets/StarRating.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _rating = 1;

  void onRatingChanged(int setRating) {
    setState(() {
      _rating = setRating;
      //print('DebugPrint setRating: $setRating');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StarRating(
                  rating: _rating,
                  onRatingChanged: (rate) {
                    print('評分事件觸發，評分為 $rate');
                  },
                )
              ],
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
