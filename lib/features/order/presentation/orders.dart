import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:flutter/material.dart';

import '../data/simple_data.dart';
import 'pages/on_going_page.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});
  static const String route = '/orders';

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Order',
          style: TextStyle(fontSize: 20),
        ),
        bottom: TabBar(
          splashBorderRadius: BorderRadius.circular(12),
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding / 2),
          ),
          labelColor: Theme.of(context).textTheme.bodyMedium?.color,
          indicatorColor: isDarkMode ? Colors.white : Colors.black,
          unselectedLabelColor:
              Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(.5),
          controller: tabController,
          tabs: [
            Tab(
              child: Text(
                'OnGoing',
                style: TextStyle(fontSize: getProportionateScreenWidth(16)),
              ),
            ),
            Tab(
              child: Text(
                'Completed',
                style: TextStyle(fontSize: getProportionateScreenWidth(16)),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      body: TabBarView(controller: tabController, children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(
              top: getProportionateScreenWidth(kDefaultPadding)),
          child: Column(
            children: [
              ...List.generate(
                dataOrder.length,
                (index) => OngoingPage(
                  isDarkMode: isDarkMode,
                  data: dataOrder[index],
                ),
              )
            ],
          ),
        ),
        const Center(
          child: Text('a'),
        )
      ]),
    );
  }
}
