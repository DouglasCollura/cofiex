import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {

  final void Function()? onPressed;
  final String text;
  final Color? buttonColor;
  final FilledButton? style;
  final IconData? icon;

  const CustomFilledButton({
    super.key, 
    this.onPressed, 
    required this.text, 
    this.buttonColor, 
    this.style,
    this.icon
  });

  @override
  Widget build(BuildContext context) {

    // const radius = Radius.circular(10);

    return FilledButton(
      style: FilledButton.styleFrom(
        fixedSize: const Size.fromWidth(double.maxFinite),
        backgroundColor: buttonColor,
        foregroundColor: Colors.white,
        shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      )),
      onPressed: onPressed, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon),
            const SizedBox(width: 8),
          ],
          Text(text)
        ],
      )
    );
  }
}