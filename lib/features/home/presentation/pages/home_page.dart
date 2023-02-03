// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/features/home/presentation/pages/categories_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/most_popular_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/my_wishlist_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/search_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/special_offer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';

import '../../data/simple_data.dart';
import '../widgets/banner_special_offer.dart';
import '../widgets/category_item_card.dart';
import '../widgets/dot_color.dart';
import '../widgets/icon_button_with_counter.dart';
import '../widgets/most_popular_item_cart.dart';
import '../widgets/most_popular_tab_bar.dart';
import 'notifications_page.dart';
import '../widgets/search_and_filter.dart';
import '../widgets/title_offer_and_see_all.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    greeting();
  }

  final time = DateTime.now().hour;
  String notification = "";
  int currentIndex = 0;

  bool lightMode =
      SchedulerBinding.instance.window.platformBrightness == Brightness.light;

  void greeting() {
    if (time < 6) {
      notification = "Good Night,";
    } else if (time < 12) {
      notification = "Good Morning,";
    } else if (time < 18) {
      notification = "Good Afternoon,";
    } else if (time < 24) {
      notification = "Good Evening,";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            headerHomePage(),
            SearchAndFilter(
                press: () => Navigator.pushNamed(context, SearchPage.route)),
            TitleOfferAndSeeAll(
              title: "Special Offer",
              press: () => Navigator.pushNamed(context, SpecialOfferPage.route),
            ),
            bannerOfferAndDot(),
            SizedBox(
              width: double.infinity,
              height: getProportionateScreenHeight(200),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => const CategoryItemCard(),
              ),
            ),
            TitleOfferAndSeeAll(
                title: 'Most Popular',
                press: () =>
                    Navigator.pushNamed(context, MostPopularPage.route)),
            mostPopularTabBar(),
            Container(
              height: SizeConfig.screenHeight - 200,
              padding: EdgeInsets.only(
                top: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
                left: getProportionateScreenWidth(20),
              ),
              child: GridView.builder(
                itemCount: dataItemMostPopular.length,
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .6,
                    crossAxisSpacing: kDefaultPadding,
                    mainAxisSpacing: kDefaultPadding),
                itemBuilder: (context, index) =>
                    MostPopularItemCard(data: dataItemMostPopular[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container mostPopularTabBar() {
    return Container(
      width: double.infinity,
      height: getProportionateScreenWidth(kDefaultPadding * 2),
      margin: EdgeInsets.only(
          top: getProportionateScreenWidth(kDefaultPadding),
          left: getProportionateScreenWidth(kDefaultPadding),
          right: getProportionateScreenWidth(kDefaultPadding / 2)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataTitleMostPopular.length,
        itemBuilder: (context, index) => MostPopularTabBar(
          data: dataTitleMostPopular[index],
          press: () {
            Navigator.pushNamed(context, CategoriesPage.route);
          },
        ),
      ),
    );
  }

  SizedBox bannerOfferAndDot() {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(220),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const BannerSpecialOffer(),
            itemCount: 5,
          ),
          Positioned(bottom: kDefaultPadding* 2,child: DotColor(currentIndex: currentIndex)),
        ],
      ),
    );
  }

  Container headerHomePage() {
    return Container(
      padding: EdgeInsets.only(
        top: getProportionateScreenWidth(10),
        left: getProportionateScreenWidth(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profileAndGreeting(),
          const Spacer(),
          Row(
            children: [
              IconButtonWithCounter(
                svg: lightMode
                    ? 'assets/icons/Bell_light.svg'
                    : 'assets/icons/Bell_light.svg',
                numOfItems: 2,
                press: () =>
                    Navigator.pushNamed(context, NotificationsPage.route),
              ),
              IconButtonWithCounter(
                svg: lightMode
                    ? 'assets/icons/Heart_light.svg'
                    : 'assets/icons/Heart_light.svg',
                numOfItems: 1,
                press: () => Navigator.pushNamed(context, MyWishlistPage.route),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row profileAndGreeting() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: getProportionateScreenWidth(48),
          height: getProportionateScreenHeight(48),
          child: CircleAvatar(
            child: Image.asset("assets/images/profile_image.png"),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(12),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.toString(), style: const TextTheme().bodySmall),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              'Kaedehara Kazuha',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(18),
              ),
            ),
          ],
        )
      ],
    );
  }
}
