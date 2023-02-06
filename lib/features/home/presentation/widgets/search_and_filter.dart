import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({
    Key? key,
    required this.press,
  }) : super(key: key);

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final lightMode = MediaQuery.of(context).platformBrightness;
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.all(getProportionateScreenWidth(kDefaultPadding)),
        width: double.infinity,
        height: getProportionateScreenHeight(kDefaultPadding * 2.5),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
                padding: EdgeInsets.all(
                    getProportionateScreenWidth(kDefaultPadding * .5)),
                width: getProportionateScreenWidth(48),
                height: getProportionateScreenHeight(48),
                child: Icon(
                  Icons.search,
                  color: lightMode == Brightness.light
                      ? Colors.black26
                      : Colors.white54,
                )),
            Text(
              "Search...",
              style: TextStyle(
                  color: lightMode == Brightness.light
                      ? Colors.black26
                      : Colors.white54),
            ),
            const Spacer(),
            Container(
                padding: EdgeInsets.all(
                    getProportionateScreenWidth(kDefaultPadding * .5)),
                width: getProportionateScreenWidth(48),
                height: getProportionateScreenHeight(48),
                child: const Icon(Icons.filter_list)),
          ],
        ),
      ),
    );
  }
}
