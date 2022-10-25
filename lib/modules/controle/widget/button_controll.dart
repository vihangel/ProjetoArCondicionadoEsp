import 'package:flutter/material.dart';
import 'package:splash_ifmt/shared/app_colors.dart';

class ButtonControll extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  const ButtonControll({Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 120,
      //width: 155,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(AppColors.stroke),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: icon,
        ),
      ),
    );
  }
}
