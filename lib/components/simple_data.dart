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
