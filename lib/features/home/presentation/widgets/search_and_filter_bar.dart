import 'package:e_commerce_app/repository/recent_history_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class SearchAndFilterBar extends StatefulWidget {
  const SearchAndFilterBar(
      {Key? key, required this.filterPress, required this.isDarkMode})
      : super(key: key);

  final VoidCallback filterPress;
  final bool isDarkMode;

  @override
  State<SearchAndFilterBar> createState() => _SearchAndFilterBarState();
}

class _SearchAndFilterBarState extends State<SearchAndFilterBar> {
  @override
  void initState() {
    super.initState();
    RecentHistoryRepository();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenWidth(kDefaultPadding * 2.5),
      margin:
          EdgeInsets.only(right: getProportionateScreenWidth(kDefaultPadding)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.isDarkMode
              ? kContentColorLightTheme
              : Colors.grey.shade100,
          border: Border.all(
              color: widget.isDarkMode
                  ? Colors.blueGrey.withOpacity(.2)
                  : Colors.black,
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
          Consumer<RecentHistoryRepository>(builder: (context, repository, child) {
            List<String> recentHistory = repository.getList;
            return Expanded(
              child: TextField(
                // style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {
                  recentHistory.add(value);
                  repository.setData(data: recentHistory);
                },
                decoration: const InputDecoration(
                    hintText: 'Search...',
                    focusColor: Colors.black,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none),
              ),
            );
          }),
          InkWell(
            onTap: widget.filterPress,
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
