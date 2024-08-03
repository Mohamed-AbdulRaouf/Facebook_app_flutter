import 'package:flutter/material.dart';

class OptionMenu extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;

  const OptionMenu(
      {super.key,
      required this.icon,
      required this.color,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(
            icon,
            size: 38.0,
            color: color,
          ),
          SizedBox(
            width: 6.0,
          ),
          Flexible(
              child: Text(
            label,
            style: TextStyle(fontSize: 16.0),
            overflow: TextOverflow.ellipsis,
          ))
        ],
      ),
    );
  }
}
