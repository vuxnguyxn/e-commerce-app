import 'package:e_commerce_app/features/home/data/simple_data.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/most_popular_item_cart.dart';
import 'package:e_commerce_app/features/home/presentation/widgets/most_popular_tab_bar.dart';
import 'package:e_commerce_app/repository/auth_repository.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../../../widgets/custom_tab_bar.dart';

class MyWishlistPage extends StatelessWidget {
  const MyWishlistPage({super.key});
  static const route = '/my_wishlist';

  @override
  Widget build(BuildContext context) {
    final uid = AuthRepository().currentUser!.uid;
    final ref = FirebaseDatabase.instance.ref('wishlists/$uid');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Wishlist',
          style: TextStyle(fontSize: 20),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Column(
        children: [
          CustomTabBar(data: dataTitleMostPopular),
          Container(
            width: double.infinity,
            height: SizeConfig.screenHeight - getProportionateScreenWidth(160),
            padding: EdgeInsets.only(
                top: getProportionateScreenWidth(kDefaultPadding),
                left: getProportionateScreenWidth(kDefaultPadding),
                right: getProportionateScreenWidth(kDefaultPadding / 2)),
            child: StreamBuilder(
              stream: ref.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (snapshot.hasData) {
                  Map<dynamic, dynamic> map =
                      snapshot.data!.snapshot.value as dynamic;

                  List<dynamic> list = [];
                  list.clear();
                  list = map.values.toList();

                  return GridView.builder(
                    itemCount: list.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .63,
                            mainAxisSpacing: kDefaultPadding,
                            crossAxisSpacing: kDefaultPadding),
                    itemBuilder: (context, index) => MostPopularItem(
                      data: list,
                      index: index,
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  // Container mostPopularTabBar() {
  //   return Container(
  //     width: double.infinity,
  //     height: getProportionateScreenWidth(kDefaultPadding * 2),
  //     margin: EdgeInsets.only(
  //         top: getProportionateScreenWidth(kDefaultPadding),
  //         left: getProportionateScreenWidth(kDefaultPadding),
  //         right: getProportionateScreenWidth(kDefaultPadding / 2)),
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: dataTitleMostPopular.length,
  //       itemBuilder: (context, index) => MostPopularTabBar(
  //         data: dataTitleMostPopular[index],
  //         press: () {},
  //       ),
  //     ),
  //   );
  // }
}
