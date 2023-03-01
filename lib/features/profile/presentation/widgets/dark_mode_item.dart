import 'package:e_commerce_app/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class DarkModeItem extends StatefulWidget {
  const DarkModeItem({
    super.key,
  });

  @override
  State<DarkModeItem> createState() => _DarkModeItemState();
}

class _DarkModeItemState extends State<DarkModeItem> {
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
          Consumer<ThemeNotifier>(
            builder: (context, theme, child) {
              return Switch(
                value: theme.getSwitchValue(),
                activeColor: Colors.white,
                activeTrackColor: Colors.grey,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey,
                onChanged: (newValue) {
                  setState(() {
                    newValue ? theme.setDarkMode() : theme.setLightMode();
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
