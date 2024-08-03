import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Function() onPressed;

  const CircleButton(
      {super.key,
      required this.icon,
      this.iconSize = 25.0,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6.0),
      decoration:
          BoxDecoration(color: Colors.grey.shade200, shape: BoxShape.circle),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: iconSize,
          color: Colors.grey.shade900,
        ),
      ),
    );
  }
}
