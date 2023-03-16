class TransactionHistory {
  String title;
  String image;
  String date;
  String time;
  TransactionHistoryType type;
  double price;
  TransactionHistory({
    required this.title,
    required this.image,
    required this.date,
    required this.time,
    required this.type,
    required this.price,
  });
}

List dataTransactionHistory = [
  TransactionHistory(
      title: 'Mini Leather',
      date: 'Dec 15, 2023',
      time: '10:00 AM',
      image: "assets/images/bag_1.png",
      type: TransactionHistoryType.order,
      price: 820.3),
  TransactionHistory(
      title: 'Mini Leather',
      date: 'Dec 15, 2023',
      time: '10:00 AM',
      image: "assets/images/bag_1.png",
      type: TransactionHistoryType.order,
      price: 820.3),
  TransactionHistory(
      title: 'Top Up Wallet',
      date: 'Dec 15, 2023',
      time: '10:00 AM',
      image: "assets/images/bag_1.png",
      type: TransactionHistoryType.topUp,
      price: 820.3),
  TransactionHistory(
      title: 'Mini Leather',
      date: 'Dec 15, 2023',
      time: '10:00 AM',
      image: "assets/images/bag_1.png",
      type: TransactionHistoryType.order,
      price: 820.3),
  TransactionHistory(
      title: 'Mini Leather',
      date: 'Dec 15, 2023',
      time: '10:00 AM',
      image: "assets/images/bag_1.png",
      type: TransactionHistoryType.order,
      price: 820.3),
  TransactionHistory(
      title: 'Top Up Wallet',
      date: 'Dec 15, 2023',
      time: '10:00 AM',
      image: "assets/images/bag_1.png",
      type: TransactionHistoryType.topUp,
      price: 820.3),
];

enum TransactionHistoryType { topUp, order }
