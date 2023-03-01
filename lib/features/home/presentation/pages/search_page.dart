import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/home/data/simple_data.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/most_popular_tab_bar.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../widgets/result_for_search_card.dart';
import '../widgets/search_and_filter_bar.dart';

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

  void _showSortAndFilterModalSheet({required bool isDarkMode}) {
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
          height: SizeConfig.screenHeight - getProportionateScreenWidth(150),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: isDarkMode ? kContentColorLightTheme : Colors.white),
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
                  CustomButton(
                      title: 'Reset',
                      color: isDarkMode
                          ? Colors.blueGrey.withOpacity(.2)
                          : Colors.grey.shade200,
                      colorText: isDarkMode ? Colors.white : Colors.black54,
                      press: () {}),
                  CustomButton(
                      title: 'Apply',
                      color: isDarkMode ? Colors.white : Colors.black,
                      colorText: isDarkMode ? Colors.black : Colors.white,
                      press: () {}),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Column titleAndListFilter(String title, List data) {
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
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(getProportionateScreenWidth(kDefaultPadding)),
          child: Column(
            children: [
              SearchAndFilterBar(
                isDarkMode: isDarkMode,
                filterPress: () {
                  _showSortAndFilterModalSheet(isDarkMode: isDarkMode);
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
