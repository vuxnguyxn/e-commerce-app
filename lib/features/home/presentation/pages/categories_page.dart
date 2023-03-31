import 'package:e_commerce_app/arguments/category_arguments.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../data/simple_data.dart';
import '../widgets/most_popular_item_cart.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  static const route = '/categories';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CategoryArguments;
    final ref = FirebaseDatabase.instance.ref('products/${args.id}');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.title,
          style: const TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(kDefaultPadding)),
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder(
            stream: ref.onValue,
            builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
              if (snapshot.hasData) {
                Map<dynamic, dynamic> map =
                    snapshot.data!.snapshot.value as dynamic;

                List<dynamic> list = [];
                list.clear();
                list = map.values.toList();
               
                return SizedBox(
                  height: double.infinity,
                  child: GridView.builder(
                    itemCount: dataItemMostPopular.length,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: .6,
                            crossAxisSpacing: kDefaultPadding,
                            mainAxisSpacing: kDefaultPadding),
                    itemBuilder: (context, index) => MostPopularItem(
                      data: list,
                      index: index,
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
