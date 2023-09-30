import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.buttonTitle,
    required this.onPressed,
    this.fixedWidth = 450.0,
    this.buttonHeight = 40.0, // Adjust the height as needed
  }) : super(key: key);

  final String buttonTitle;
  final Function onPressed;
  final double fixedWidth;
  final double buttonHeight; // Add a button height property

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight, // Set the height of the SizedBox
      child: Container(
        width: fixedWidth,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontStyle: FontStyle.normal,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          onPressed: () {
            onPressed();
          },
          child: Text(buttonTitle),
        ),
      ),
    );
  }
}
