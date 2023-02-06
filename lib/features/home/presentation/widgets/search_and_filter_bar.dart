import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar({Key? key, required this.filterPress})
      : super(key: key);

  final VoidCallback filterPress;

  @override
  Widget build(BuildContext context) {
    final lightMode = MediaQuery.of(context).platformBrightness;
    return Container(
      width: double.infinity,
      height: getProportionateScreenWidth(kDefaultPadding * 2.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: lightMode == Brightness.light
              ? Colors.grey.shade100
              : kContentColorLightTheme,
          border: Border.all(
              color: lightMode == Brightness.light
                  ? Colors.black
                  : Colors.blueGrey.withOpacity(.2),
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
                child: const Icon(Icons.filter_list)),
          ),
        ],
      ),
    );
  }
}
