import 'package:e_commerce_app/features/home/models/product_model.dart';
import 'package:firebase_database/firebase_database.dart';

class ProductRepository {
  void getProductMostPopular({required List<Product> products}) {
    final ref = FirebaseDatabase.instance.ref('products');
    ref.onValue.listen((event) {
      final map = event.snapshot.value as Map<dynamic, dynamic>;
      map.forEach((key, value) {
        final product = Product.fromMap(value);
        product.id = key;
        products.add(product);
      });
    });
  }
}
