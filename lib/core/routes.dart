import 'package:e_commerce_app/features/cart/presentation/cart.dart';
import 'package:e_commerce_app/features/cart/presentation/pages/check_out_page.dart';
import 'package:e_commerce_app/features/cart/presentation/pages/choose_shipping_page.dart';
import 'package:e_commerce_app/features/cart/presentation/pages/promo_page.dart';
import 'package:e_commerce_app/features/cart/presentation/pages/shipping_address_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/categories_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/most_popular_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/my_wishlist_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/notifications_page.dart';
import 'package:e_commerce_app/features/home/presentation/home.dart';
import 'package:e_commerce_app/features/home/presentation/pages/product_detail_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/search_page.dart';
import 'package:e_commerce_app/features/home/presentation/pages/special_offer_page.dart';
import 'package:e_commerce_app/features/order/presentation/orders.dart';
import 'package:e_commerce_app/features/profile/presentation/pages/address_page.dart';
import 'package:e_commerce_app/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:e_commerce_app/features/profile/presentation/pages/notification_page.dart';
import 'package:e_commerce_app/features/signin/sign_in.dart';
import 'package:e_commerce_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.route: (context) => const SplashScreen(),
  HomeScreen.route: (context) => const HomeScreen(),
  NotificationsPage.route: (context) => const NotificationsPage(),
  MyWishlistPage.route: (context) => const MyWishlistPage(),
  SpecialOfferPage.route: (context) => const SpecialOfferPage(),
  MostPopularPage.route: (context) => const MostPopularPage(),
  SearchPage.route: (context) => const SearchPage(),
  CategoriesPage.route: (context) => const CategoriesPage(),
  ProductDetailPage.route: (context) => const ProductDetailPage(),
  Cart.route: (context) => const Cart(),
  CheckoutPage.route: (context) => const CheckoutPage(),
  ShippingAddressPage.route:(context) => const ShippingAddressPage(),
  ChooseShippingPage.route:(context) => const ChooseShippingPage(),
  PromoPage.route:(context) => const PromoPage(),
  EditProfilePage.route:(context) => const EditProfilePage(),
  AddressPage.route:(context) => const AddressPage(),
  NotificationPage.route: (context) => const NotificationPage(),
  Orders.route: (context) => const Orders(),
  SignIn.route: (context) => const SignIn(),
};