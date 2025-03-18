// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SetElevatedButton extends StatefulWidget {
  final double setWidth;
  final double setHeight;
  final double setRadius;
  final Color setBtnBackColor;
  final String setBtnText;
  const SetElevatedButton(
      {super.key,
      this.setWidth = 10,
      this.setHeight = 10,
      this.setRadius = 0,
      this.setBtnBackColor = const Color.fromARGB(215, 230, 229, 229),
      this.setBtnText = ''});

  @override
  SetElevatedButtonState createState() => SetElevatedButtonState();
}

class SetElevatedButtonState extends State<SetElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.share, color: Colors.black),
      label: Text("Share", style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200], // 背景顏色
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.setRadius), // 圓角
        ),
        elevation: 0, // 無陰影
        padding: EdgeInsets.symmetric(
            horizontal: widget.setWidth, vertical: widget.setHeight),
      ),
    );
  }
}
