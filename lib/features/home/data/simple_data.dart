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
  bool? isFavorites;
  int price;

  DataItemMostPopular({
    required this.image,
    required this.title,
    required this.sold,
    required this.star,
    this.isFavorites = false,
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
List dataItemFavorites = [
  DataItemMostPopular(
      image: 'assets/images/bag_1.png',
      title: 'Snake Leather Bag',
      isFavorites: true,
      sold: 1000,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_2.png',
      title: 'Eagle Leather Bag',
      sold: 1000,
      isFavorites: true,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_3.png',
      title: 'Crocodile Leather Bag',
      sold: 1000,
      star: 4.5,
      isFavorites: true,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_4.png',
      title: 'Bears Leather Bag',
      sold: 1000,
      star: 4.5,
      isFavorites: true,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_5.png',
      title: 'Tiger Leather Bag',
      sold: 1000,
      isFavorites: true,
      star: 4.5,
      price: 650),
  DataItemMostPopular(
      image: 'assets/images/bag_6.png',
      title: 'Wolf Leather Bag',
      sold: 1000,
      star: 4.5,
      isFavorites: true,
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

class Notifications {
  String date;
  List<Notification> notifications;
  Notifications({
    required this.date,
    required this.notifications,
  });
}

List dataNotifications = [
  Notifications(
    date: "Today",
    notifications: [
      Notification(
          title: "30% Special Discount!",
          content: "Special promotion only valid today.",
          image: "discount"),
    ],
  ),
  Notifications(
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
  Notifications(
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

List historySearch = [
  'Snack Skin Bag',
  'Casual Shirt',
  'Black Nike Shoes',
  'HeadPhone Whites',
  'Nikon Camera',
  'Silver Watch',
  'Snack Skin Bag',
  'Casual Shirt',
  'Black Nike Shoes',
  'HeadPhone Whites',
  'Nikon Camera',
  'Silver Watch'
];
