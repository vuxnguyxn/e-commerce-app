class ProductArguments {
  final String id;
  final String title;
  final String description;
  final bool favorite;
  final List image;
  final int price;
  final int reviews;
  final List size;
  final List color;
  final int sold;
  final double star;

  ProductArguments({
    required this.color,
    required this.title,
    required this.description,
    required this.favorite,
    required this.image,
    required this.price,
    required this.reviews,
    required this.size,
    required this.sold,
    required this.star,
    required this.id,
  });
}
