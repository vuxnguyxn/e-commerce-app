// ignore_for_file: public_member_api_docs, sort_constructors_first
class DataTitleMostPopular {
  String title;
  bool? isSelested;
  DataTitleMostPopular({
    required this.title,
    this.isSelested = false,
  });
}

List dataTitleMostPopular = [
  DataTitleMostPopular(title: 'All', isSelested: true),
  DataTitleMostPopular(title: 'Clother', isSelested: false),
  DataTitleMostPopular(title: 'T-Shirt', isSelested: false),
  DataTitleMostPopular(title: 'Hat', isSelested: false),
  DataTitleMostPopular(title: 'Hoodie', isSelested: false),
  DataTitleMostPopular(title: 'Leggeng', isSelested: false),
  DataTitleMostPopular(title: 'Sweater', isSelested: false),
];

class DataItemMostPopular {
  String image;
  String title;
  int sold;
  double star;
  bool? isFavorited;
  int price;

  DataItemMostPopular({
    required this.image,
    required this.title,
    required this.sold,
    required this.star,
    this.isFavorited = false,
    required this.price,
  });
}

List dataItemMostPopular = [
  DataItemMostPopular(
      image: 'assets/images/bag_1.png',
      title: 'Snake Leather Bag',
      sold: 1000,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_2.png',
      title: 'Eagle Leather Bag',
      sold: 1000,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_3.png',
      title: 'Crocodie Leather Bag',
      sold: 1000,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_4.png',
      title: 'Bears Leather Bag',
      sold: 1000,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_5.png',
      title: 'Tiger Leather Bag',
      sold: 1000,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_6.png',
      title: 'Wolf Leather Bag',
      sold: 1000,
      star: 4.5,
      price: 650),
];
