import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'icon_button_with_counter.dart';

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
            Container(
              margin:
                  EdgeInsets.all(getProportionateScreenWidth(kDefaultPadding)),
              width: double.infinity,
              height: getProportionateScreenHeight(kDefaultPadding * 2),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.3),
                borderRadius: BorderRadius.circular(kDefaultPadding),
              ),
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(
                          getProportionateScreenWidth(kDefaultPadding * .5)),
                      width: getProportionateScreenWidth(48),
                      height: getProportionateScreenHeight(48),
                      child: const Icon(Icons.search)),
                  const Text(
                    "Search...",
                    style: TextStyle(color: Colors.black26),
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
            Container(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(kDefaultPadding),
                top: getProportionateScreenWidth(kDefaultPadding),
                right: getProportionateScreenWidth(kDefaultPadding),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Special Offer",
                    style: TextStyle(fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(
                    getProportionateScreenWidth(kDefaultPadding)),
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/image_banner.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(kDefaultPadding),
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(kDefaultPadding)),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: '30%\n',
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(
                                kDefaultPadding * 1.5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "Today's special\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(
                                kDefaultPadding * 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Get discount for every order,\n only valid for today',
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(
                                kDefaultPadding * .7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
