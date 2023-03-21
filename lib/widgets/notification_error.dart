import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/size_config.dart';

class NotificationError extends StatelessWidget {
  const NotificationError({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        getProportionateScreenWidth(kDefaultPadding),
      ),
      child: text != ""
          ? Text(
              textAlign: TextAlign.center,
              text.split(']')[1],
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold),
            )
          : null,
    );
  }
}
