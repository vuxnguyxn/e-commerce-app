import 'package:e_commerce_app/features/home/presentation/pages/most_popular_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/my_wishlist_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/notifications_page.dart';
import 'package:e_commerce_app/features/home/presentation/home.dart';
import 'package:e_commerce_app/features/home/presentation/pages/special_offer_page.dart';
import 'package:e_commerce_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.route: (context) => const SplashScreen(),
   HomeScreen.route: (context) => const HomeScreen(),
   NotificationsPage.route: (context) => const NotificationsPage(),
   MyWishlistPage.route: (context) => const MyWishlistPage(),
   SpecialOfferPage.route: (context) => const SpecialOfferPage(),
   MostPopularPage.route: (context) => const MostPopularPage(),
};

