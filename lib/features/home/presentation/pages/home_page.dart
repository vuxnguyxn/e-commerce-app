import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../../../repository/auth_repository.dart';
import '../../data/simple_data.dart';
import '../widgets/banner_special_offer.dart';
import '../widgets/category_item_card.dart';
import '../widgets/dot_color.dart';
import '../widgets/icon_button_with_counter.dart';
import '../widgets/most_popular_tab_bar.dart';
import 'most_popular_page.dart';
import 'my_wishlist_page.dart';
import 'notifications_page.dart';
import '../widgets/search_and_filter.dart';
import '../widgets/title_offer_and_see_all.dart';
import 'search_page.dart';
import 'special_offer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final time = DateTime.now().hour;
  String notification = "";
  int currentIndex = 0;
  final user = AuthRepository().currentUser;

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
  void initState() {
    super.initState();
    greeting();
  }

  @override
  void dispose() {
    super.dispose();
    greeting();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              headerHomePage(),
              SearchAndFilter(
                  darkMode: isDarkMode,
                  press: () => Navigator.pushNamed(context, SearchPage.route)),
              TitleOfferAndSeeAll(
                title: "Special Offer",
                press: () =>
                    Navigator.pushNamed(context, SpecialOfferPage.route),
              ),
              bannerOfferAndDot(),
              categoryCard(),
              TitleOfferAndSeeAll(
                  title: 'Most Popular',
                  press: () =>
                      Navigator.pushNamed(context, MostPopularPage.route)),
              const MostPopularTabBar(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox categoryCard() {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(200),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataCategory.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => CategoryItemCard(
          data: dataCategory[index],
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
          Positioned(
              bottom: kDefaultPadding * 2,
              child: DotColor(currentIndex: currentIndex, length: 5,)),
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
                icon: Icons.notifications_none,
                numOfItems: 2,
                press: () =>
                    Navigator.pushNamed(context, NotificationsPage.route),
              ),
              IconButtonWithCounter(
                icon: Icons.favorite_border,
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
          height: getProportionateScreenWidth(48),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: user!.photoURL == null
                ? Image.asset("assets/images/profile_image.png")
                : Image.network(user!.photoURL!),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(12),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.toString(),
              style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.color
                    ?.withOpacity(.7),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              user!.displayName ?? "Peter Parker",
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

