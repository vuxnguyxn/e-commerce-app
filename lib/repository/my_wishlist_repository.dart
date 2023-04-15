// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_database/firebase_database.dart';

class MyWishlistRepository {
  // final String id;
  // final String title;
  // final String description;
  // final bool favorite;
  // final List listImage;
  // final int price;
  // final int reviews;
  // final List size;
  // final List color;
  // final int sold;
  // final double star;
  // MyWishlistRepository({
  //   required this.id,
  //   required this.title,
  //   required this.description,
  //   required this.favorite,
  //   required this.listImage,
  //   required this.price,
  //   required this.reviews,
  //   required this.size,
  //   required this.color,
  //   required this.sold,
  //   required this.star,
  // });

  Future<void> upLoadWishlist({
    required String uid,
    required String title,
    required String description,
    required List listImage,
    required int price,
    required int reviews,
    required List size,
    required List color,
    required int sold,
    required double star,
    required String id,
    required String type,
  }) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("wishlists/$uid/wishlist_$type/$id");
    DatabaseReference refAll =
        FirebaseDatabase.instance.ref("wishlists/$uid/wishlist_all/$id");
    Map<String, dynamic> map = {
      "id": id,
      "title": title,
      "description": description,
      "favorite": true,
      "list-image": listImage,
      "price": price,
      "reviews": reviews,
      "size": size,
      "color": color,
      "star": star,
      "sold": sold,
      "type": type,
    };
    await ref.set(map);
    await refAll.set(map);
  }

  Future<void> deletedWishlist({
    required String uid,
    required String id,
    required String type,
  }) async {
    DatabaseReference refAll =
        FirebaseDatabase.instance.ref("wishlists/$uid/wishlist_all/$id");
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("wishlists/$uid/wishlist_$type/$id");
    ref.remove();
    refAll.remove();
  }
}
