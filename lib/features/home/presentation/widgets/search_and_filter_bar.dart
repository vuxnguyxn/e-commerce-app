import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar(
      {Key? key, required this.filterPress, required this.isDarkMode})
      : super(key: key);

  final VoidCallback filterPress;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenWidth(kDefaultPadding * 2.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isDarkMode ? kContentColorLightTheme : Colors.grey.shade100,
          border: Border.all(
              color:
                  isDarkMode ? Colors.blueGrey.withOpacity(.2) : Colors.black,
              width: 1)),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.all(
                  getProportionateScreenWidth(kDefaultPadding * .5)),
              width: getProportionateScreenWidth(48),
              height: getProportionateScreenHeight(48),
              child: const Icon(
                Icons.search,
              )),
          const Expanded(
            child: TextField(
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                  hintText: 'Search...',
                  focusColor: Colors.black,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none),
            ),
          ),
          InkWell(
            onTap: filterPress,
            child: Container(
              padding: EdgeInsets.all(
                  getProportionateScreenWidth(kDefaultPadding * .5)),
              width: getProportionateScreenWidth(48),
              height: getProportionateScreenHeight(48),
              child: const Icon(Icons.filter_list),
            ),
          ),
        ],
      ),
    );
  }
}
