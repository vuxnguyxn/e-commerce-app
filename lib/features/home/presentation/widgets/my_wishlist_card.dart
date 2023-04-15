import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../../../repository/auth_repository.dart';
import 'my_wishlist_item.dart';

class MyWishlistCard extends StatelessWidget {
  const MyWishlistCard({
    super.key,
    required this.idTabBar,
  });

  final String idTabBar;

  @override
  Widget build(BuildContext context) {
    final uid = AuthRepository().currentUser!.uid;
    final ref =
        FirebaseDatabase.instance.ref('wishlists/$uid/wishlist_$idTabBar');

    return Container(
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
            if (snapshot.data!.snapshot.value != null) {
              Map<dynamic, dynamic> map =
                  snapshot.data!.snapshot.value as dynamic;

              List<dynamic> list = [];
              list.clear();
              list = map.values.toList();
              return GridView.builder(
                itemCount: list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .63,
                    mainAxisSpacing: kDefaultPadding,
                    crossAxisSpacing: kDefaultPadding),
                itemBuilder: (context, index) => MyWishlistItem(
                  data: list,
                  index: index,
                ),
              );
            } else {
              return const Center(
                child: Text(''),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
