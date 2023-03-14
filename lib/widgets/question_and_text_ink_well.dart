import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/size_config.dart';

class QuestionAndTextInkWell extends StatelessWidget {
  const QuestionAndTextInkWell({
    super.key,
    required this.title,
    required this.question,
    required this.press,
  });
  final String title;
  final String question;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question),
        InkWell(
          onTap: press,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(kDefaultPadding / 4)),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(16),
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
