import 'package:flutter/material.dart';

import '../../../../arguments/product_arguments.dart';
import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../../../repository/auth_repository.dart';
import '../../../../repository/my_wishlist_repository.dart';
import '../pages/product_detail_page.dart';

class MyWishlistItem extends StatefulWidget {
  const MyWishlistItem({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final List data;
  final int index;

  @override
  State<MyWishlistItem> createState() => _MyWishlistItemState();
}

class _MyWishlistItemState extends State<MyWishlistItem> {
  bool isFavorites = true;
  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    final uid = AuthRepository().currentUser!.uid;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailPage.route,
          arguments: ProductArguments(
              title: widget.data[widget.index]["title"],
              color: widget.data[widget.index]["color"],
              description: widget.data[widget.index]["description"],
              favorite: widget.data[widget.index]["favorite"],
              image: widget.data[widget.index]["list-image"],
              price: widget.data[widget.index]["price"],
              reviews: widget.data[widget.index]["reviews"],
              size: widget.data[widget.index]["size"],
              sold: widget.data[widget.index]["sold"],
              star: widget.data[widget.index]["star"],
              id: widget.data[widget.index]["id"]),
        );
      },
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(
                    getProportionateScreenWidth(kDefaultPadding),
                  ),
                  margin: EdgeInsets.only(
                      bottom: getProportionateScreenWidth(kDefaultPadding)),
                  decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.blueGrey.withOpacity(.2)
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15)),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: widget.data[widget.index]["list-image"][0] != null
                        ? Image.network(
                            widget.data[widget.index]["list-image"][0])
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isFavorites = !isFavorites;
                        if (!isFavorites) {
                          //set product in my wishlist
                          MyWishlistRepository().deletedWishlist(
                              uid: uid, id: widget.data[widget.index]["id"]);
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black45, width: 1),
                        color: Colors.black45,
                      ),
                      child: widget.data[widget.index]["favorite"]
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 16,
                            )
                          : const Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 16,
                            ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              widget.data[widget.index]["title"],
              maxLines: 1,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(16)),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Row(
              children: [
                const Icon(Icons.star_half),
                Text("${widget.data[widget.index]["star"]} | "),
                Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                  decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.blueGrey.withOpacity(.2)
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    "${widget.data[widget.index]["sold"]} sold",
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              "\$${widget.data[widget.index]["price"]}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(16)),
            )
          ],
        ),
      ),
    );
  }
}
