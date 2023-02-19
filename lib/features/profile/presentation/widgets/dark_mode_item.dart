import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class DarkModeItem extends StatefulWidget {
  const DarkModeItem({
    super.key,
  });

  @override
  State<DarkModeItem> createState() => _DarkThemeItemState();
}

class _DarkThemeItemState extends State<DarkModeItem> {
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(kDefaultPadding),
          right: kDefaultPadding / 2),
      width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.dark_mode),
          SizedBox(
            width: getProportionateScreenWidth(kDefaultPadding / 2),
          ),
          const Expanded(child: Text('Dark Mode')),
          Switch(
            value: switchValue,
            activeColor: Colors.white,
            activeTrackColor: Colors.grey,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey,
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
