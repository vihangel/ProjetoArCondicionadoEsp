import 'package:flutter/material.dart';
import 'package:splash_ifmt/shared/app_colors.dart';
import 'package:splash_ifmt/shared/app_text_styles.dart';

class ElevatedCard extends StatelessWidget {
  final String title;
  final String value;
  const ElevatedCard({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.35,
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
        onPressed: () {},
        child: Text(
          "$title: $value ",
          style: TextStyles.small,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
