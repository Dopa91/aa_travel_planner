import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    super.key,
    required this.buttonText,
    required this.action,
  });

  final String buttonText;

  final void Function()? action;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        action;
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[600]),
      child: Text(
        buttonText,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
