import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StarRating extends StatefulWidget {
  final int rating;
  final ValueChanged<int> onRatingChanged;
  const StarRating(
      {super.key, required this.rating, required this.onRatingChanged});
  @override
  StarRatingState createState() => StarRatingState();
}

class StarRatingState extends State<StarRating> {
  int currentRating = 1;

  @override
  void initState() {
    super.initState();
    currentRating = widget.rating;
  }

  void setRating(int rating) {
    setState(() {
      currentRating = rating;
    });
    widget.onRatingChanged(rating);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (int i = 1; i <= 5; i++)
            Star(
              filled: i <= currentRating,
              onPressed: () => {setRating(i)},
            ),
        ]),
        Text('目前評分: $currentRating',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ],
    );

    /*Row(mainAxisSize: MainAxisSize.min);*/
  }
}

class Star extends StatelessWidget {
  final bool _filled;
  final VoidCallback onPressed;
  const Star({super.key, bool filled = false, required this.onPressed})
      : _filled = filled;

  @override
  Widget build(BuildContext context) {
    //print('DebugPrint _filled: $_filled');
    return IconButton(
      icon: Icon(
        _filled ? Icons.star : Icons.star_border,
        color: Colors.yellow,
      ),
      onPressed: onPressed,
    );
  }
}
