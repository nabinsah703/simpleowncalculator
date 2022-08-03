import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {Key? key,
      this.color,
      this.textColor,
      this.buttonTapped,
      this.buttonText})
      : super(key: key);
  final color;
  final textColor;
  final buttonTapped;
  final buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: ClipRRect(
            child: Container(
          color: color,
          child: Text(
            buttonText,
            style: TextStyle(
                color: textColor, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        )),
      ),
    );
  }
}
