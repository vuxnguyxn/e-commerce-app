import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/home/data/simple_data.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/most_popular_tab_bar.dart';
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
  String resultFound = "20,220";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showSortAndFilterModalSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (builder) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding),
            vertical: getProportionateScreenWidth(kDefaultPadding),
          ),
          height: SizeConfig.screenHeight - 150,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Soft And Filter',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(kDefaultPadding),
              ),
              titleAndListFilter("Categories", dataTitleMostPopular),
              titleAndListFilter("Price Range", dataPriceRange),
              titleAndListFilter("Sort by", dataSortBy),
              titleAndListFilter("Rating", dataRating),
              SizedBox(
                height: getProportionateScreenHeight(kDefaultPadding * 2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buttonSortAndFilter(
                      'Reset', Colors.grey.shade200, Colors.black54, () {}),
                  buttonSortAndFilter(
                      'Apply', Colors.black, Colors.white, () {}),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Container buttonSortAndFilter(
      String title, Color color, Color colorText, VoidCallback press) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(kDefaultPadding * 2),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
      child: TextButton(
        onPressed: press,
        child: Text(
          title,
          style: TextStyle(color: colorText),
        ),
      ),
    );
  }

  Column titleAndListFilter(String title,  List data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: double.infinity,
          height: getProportionateScreenWidth(kDefaultPadding * 2),
          margin: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(kDefaultPadding)),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) => MostPopularTabBar(
              data: data[index],
              press: () {},
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(getProportionateScreenWidth(kDefaultPadding)),
          child: Column(
            children: [
              SearchAndFilterBar(
                filterPress: () {
                  _showSortAndFilterModalSheet();
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(kDefaultPadding),
              ),
              // const RecentHistoryCard(),
              ResultForSearchCard(
                  textSearch: textSearch, resultFound: resultFound)
            ],
          ),
        ),
      ),
    );
  }
}

class ResultForSearchCard extends StatelessWidget {
  const ResultForSearchCard({
    Key? key,
    required this.textSearch,
    required this.resultFound,
  }) : super(key: key);

  final String textSearch;
  final String resultFound;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Result for "$textSearch"',
                overflow: textSearch.length > 10 ? TextOverflow.ellipsis : null,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                '$resultFound found',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(kDefaultPadding),
          ),
          Expanded(
            child: GridView.builder(
              itemBuilder: (context, index) =>
                  MostPopularItemCard(data: dataItemMostPopular[index]),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .6,
                  mainAxisSpacing: kDefaultPadding,
                  crossAxisSpacing: kDefaultPadding),
              itemCount: dataItemMostPopular.length,
            ),
          )
        ],
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
