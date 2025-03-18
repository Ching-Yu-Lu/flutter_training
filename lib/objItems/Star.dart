// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  final bool _filled;
  final VoidCallback onPressed;
  const Star({super.key, bool filled = false, required this.onPressed})
      : _filled = filled;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _filled ? Icons.star : Icons.star_border,
        color: const Color.fromARGB(244, 246, 198, 8),
        size: 42,
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
