import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/home/data/simple_data.dart';
import 'package:flutter/material.dart';

import '../widgets/most_popular_item_cart.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static const route = '/search';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String textSearch = "Electronic";
  String foundsSearch = "20,220";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(getProportionateScreenWidth(kDefaultPadding)),
          child: Column(
            children: [
              SearchAndFilterBar(
                filterPress: () {},
              ),
              SizedBox(
                height: getProportionateScreenHeight(kDefaultPadding),
              ),
               const RecentHistoryCard(),
              
            ],
          ),
        ),
      ),
    );
  }
}


class RecentHistoryCard extends StatelessWidget {
  const RecentHistoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Recent',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(12),
                child: const Text(
                  'Clear All',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(kDefaultPadding),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: historySearch.length,
              itemBuilder: (context, index) => Row(
                children: [
                  Text(
                    historySearch[index],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.cancel),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar({Key? key, required this.filterPress})
      : super(key: key);

  final VoidCallback filterPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenWidth(kDefaultPadding * 2.5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey.shade100,
          border: Border.all(color: Colors.black, width: 1)),
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
