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
  }) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("wishlists/$uid/$id");

    await ref.set({
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
    });
  }

  Future<void> deletedWishlist({
    required String uid,
    required String id,
  }) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("wishlists/$uid/$id");
    ref.remove();
  }
}
