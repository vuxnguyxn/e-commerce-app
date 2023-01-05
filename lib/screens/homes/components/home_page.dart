import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'banner_special_offer.dart';
import 'icon_button_with_counter.dart';
import 'search_and_filter.dart';
import 'title_offer_and_see_all.dart';

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
  String notifiaction = "";
  int currentIndex = 0;

  bool lightMode =
      SchedulerBinding.instance.window.platformBrightness == Brightness.light;

  void greeting() {
    if (time < 6) {
      notifiaction = "Good Night,";
    } else if (time < 12) {
      notifiaction = "Good Morning,";
    } else if (time < 18) {
      notifiaction = "Good Afternoom,";
    } else if (time < 24) {
      notifiaction = "Good Evening,";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            headerHomePage(),
            const SearchAndFilter(),
            TitleOfferAndSeeAll(
              title: "Special Offer",
              press: () {},
            ),
            bannerOfferAndDot(),
          ],
        ),
      ),
    );
  }

  SizedBox bannerOfferAndDot() {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(220),
      child: Stack(
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
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(
                bottom: getProportionateScreenWidth(kDefaultPadding * 2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => AnimatedContainer(
                  margin:
                      EdgeInsets.only(right: getProportionateScreenWidth(8)),
                  duration: const Duration(seconds: 1),
                  height: 6,
                  width: currentIndex == index ? 20 : 6,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                ),
              ),
            ),
          ),
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
                press: () {},
              ),
              IconButtonWithCounter(
                svg: lightMode
                    ? 'assets/icons/Heart_light.svg'
                    : 'assets/icons/Heart_light.svg',
                numOfItems: 1,
                press: () {},
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
            Text(
              notifiaction.toString(),
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: getProportionateScreenWidth(16)),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              "Chường Dũ",
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


