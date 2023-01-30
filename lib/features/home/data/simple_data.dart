
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
List dataItemFavorited = [
  DataItemMostPopular(
      image: 'assets/images/bag_1.png',
      title: 'Snake Leather Bag',
      isFavorited: true,
      sold: 1000,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_2.png',
      title: 'Eagle Leather Bag',
      sold: 1000,
      isFavorited: true,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_3.png',
      title: 'Crocodie Leather Bag',
      sold: 1000,
      star: 4.5,
      isFavorited: true,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_4.png',
      title: 'Bears Leather Bag',
      sold: 1000,
      star: 4.5,
      isFavorited: true,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_5.png',
      title: 'Tiger Leather Bag',
      sold: 1000,
      isFavorited: true,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_6.png',
      title: 'Wolf Leather Bag',
      sold: 1000,
      star: 4.5,
      isFavorited: true,
      price: 650),
];

class Notification {
  String title;
  String content;
  String image;
  Notification({
    required this.title,
    required this.content,
    required this.image,
  });
}

class Notifiactions {
  String date;
  List<Notification> notifications;
  Notifiactions({
    required this.date,
    required this.notifications,
  });
}

List dataNotifications = [
  Notifiactions(
    date: "Today",
    notifications: [
      Notification(
          title: "30% Special Discount!",
          content: "Special promotion only valid today.",
          image: "discount"),
    ],
  ),
  Notifiactions(
    date: "Yesterday",
    notifications: [
      Notification(
          title: "Top Up E-Wallet Succesful!",
          content: "You have to top up your e-wallet",
          image: "wallet"),
      Notification(
          title: "New Service Available!",
          content: "Now you can track orders is real time",
          image: "location"),
    ],
  ),
  Notifiactions(
    date: "December 22, 2023",
    notifications: [
      Notification(
          title: "Credit Card Conected!",
          content: "Credit Card has been linked!",
          image: "credit"),
      Notification(
          title: "Account Setup Successful!",
          content: "Your account has been created!",
          image: "account"),
    ],
  ),
];
