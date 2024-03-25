import 'package:flutter/material.dart';

class Plusbutton extends StatelessWidget {
  final function;
  const Plusbutton({super.key, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 75,
        width: 75,
        decoration: BoxDecoration(
            color: Colors.grey[400], shape: BoxShape.circle),
        child: const Center(
          child: Text(
            '+',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
