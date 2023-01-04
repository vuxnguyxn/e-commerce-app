import 'package:e_commerce_app/components/item_bar.dart';
import 'package:e_commerce_app/screens/homes/components/home_page.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> page = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: page[selectedIndex],
      bottomNavigationBar: customBottomNavigationBar(),
    );
  }

  SizedBox customBottomNavigationBar() {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenWidth(kDefaultPadding * 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // ...List.generate(5, (index) => )
          ItemBar(
            title: 'Home',
            isSelected: selectedIndex == 0,
            icon: selectedIndex == 0 ? Icons.home : Icons.home_outlined,
            press: () {
              setState(() {
                selectedIndex = 0;
              });
            },
          ),
          ItemBar(
            title: 'Cart',
            isSelected: selectedIndex == 1,
            icon: selectedIndex == 1
                ? Icons.shopping_bag
                : Icons.shopping_bag_outlined,
            press: () {
              setState(() {
                selectedIndex = 1;
              });
            },
          ),
          ItemBar(
            title: 'Order',
            isSelected: selectedIndex == 2,
            icon: selectedIndex == 2
                ? Icons.shopping_cart
                : Icons.shopping_cart_outlined,
            press: () {
              setState(() {
                selectedIndex = 2;
              });
            },
          ),
          ItemBar(
            title: 'Wallet',
            isSelected: selectedIndex == 3,
            icon: selectedIndex == 3 ? Icons.add_card : Icons.add_card_outlined,
            press: () {
              setState(() {
                selectedIndex = 3;
              });
            },
          ),
          ItemBar(
            title: 'Profile',
            isSelected: selectedIndex == 4,
            icon: selectedIndex == 4 ? Icons.person : Icons.person_outline,
            press: () {
              setState(() {
                selectedIndex = 4;
              });
            },
          ),
        ],
      ),
    );
  }
}
