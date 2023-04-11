import 'package:e_commerce_app/features/home/presentation/widgets/most_popular_tab_bar.dart';
import 'package:flutter/material.dart';

class MostPopularPage extends StatelessWidget {
  const MostPopularPage({super.key});
  static const route = '/most_popular';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Most Popular',
          style: TextStyle(fontSize: 20),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: const MostPopularTabBar(),
    );
  }
}
