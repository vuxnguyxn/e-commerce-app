import 'package:e_commerce_app/features/home/presentation/widgets/my_wishlist_tab_bar.dart';
import 'package:flutter/material.dart';

class MyWishlistPage extends StatelessWidget {
  const MyWishlistPage({super.key});
  static const route = '/my_wishlist';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Wishlist',
          style: TextStyle(fontSize: 20),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: const MyWishlistTabBar()
    );
  }
}

