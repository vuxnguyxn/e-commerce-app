import 'package:flutter/material.dart';

import '../../data/simple_data.dart';
import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class MostPopularTabBar extends StatelessWidget {
  const MostPopularTabBar({Key? key, required this.press, required this.data})
      : super(key: key);

  final DataTitleMostPopular data;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool darkMode = brightness == Brightness.dark;

    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        margin: EdgeInsets.only(
            right: getProportionateScreenWidth(kDefaultPadding / 2)),
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: darkMode
              ? data.isSelected == true
                  ? Colors.blueGrey.withOpacity(.2)
                  : kContentColorLightTheme
              : data.isSelected == true
                  ? Colors.black
                  : Colors.white,
          border: darkMode
              ? Border.all(color: Colors.blueGrey.withOpacity(.2), width: 2)
              : Border.all(color: Colors.black, width: 2),
        ),
        child: Center(
          child: Text(
            data.title,
            style: darkMode
                ? TextStyle(
                    color:
                        data.isSelected == true ? Colors.white : Colors.white)
                : TextStyle(
                    color:
                        data.isSelected == true ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
