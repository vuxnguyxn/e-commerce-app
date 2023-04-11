import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../core/size_config.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key, required this.data})
      : super(key: key);

  final List data;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool darkMode = brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      height: getProportionateScreenWidth(45),
      margin: EdgeInsets.only(
          top: getProportionateScreenWidth(kDefaultPadding),
          left: getProportionateScreenWidth(kDefaultPadding),
          right: getProportionateScreenWidth(kDefaultPadding / 2)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.data.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(
              right: getProportionateScreenWidth(kDefaultPadding / 2)),
          child: InkWell(
            onTap: () {
              setState(() {
                isSelected = index;
              });
            },
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(kDefaultPadding)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: darkMode
                    ? isSelected == index
                        ? Colors.blueGrey.withOpacity(.2)
                        : kContentColorLightTheme
                    : isSelected == index
                        ? Colors.black
                        : Colors.white,
                border: darkMode
                    ? Border.all(
                        color: Colors.blueGrey.withOpacity(.2), width: 2)
                    : Border.all(color: Colors.black, width: 2),
              ),
              child: Center(
                child: Text(
                  widget.data[index].title,
                  style: darkMode
                      ? TextStyle(
                          color:
                              isSelected == index ? Colors.white : Colors.white)
                      : TextStyle(
                          color: isSelected == index
                              ? Colors.white
                              : Colors.black),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
