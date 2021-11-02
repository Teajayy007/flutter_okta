import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback press;
  final String title;

  const MyButton({
    Key? key,
    required this.press,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
          backgroundColor: MaterialStateProperty.all(
            Colors.orange,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}
