import 'package:e_commerce_app/features/home/presentation/pages/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/simple_data.dart';
import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class MostPopularItemCard extends StatelessWidget {
  const MostPopularItemCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final DataItemMostPopular data;

  @override
  Widget build(BuildContext context) {
    final lightMode = MediaQuery.of(context).platformBrightness;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailPage.route);
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
                      color: lightMode == Brightness.light
                          ? Colors.grey.shade200
                          : Colors.blueGrey.withOpacity(.2),
                      borderRadius: BorderRadius.circular(15)),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      data.image,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    height: 24,
                    width: 24,
                    padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1),
                      color: Colors.black,
                    ),
                    child: data.isFavorites!
                        ? SvgPicture.asset("assets/icons/Favorites.svg")
                        : SvgPicture.asset("assets/icons/Heart_dark.svg"),
                  ),
                ),
              ],
            ),
            Text(
              data.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Row(
              children: [
                const Icon(Icons.star_half),
                Text("${data.star} | "),
                Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                  decoration: BoxDecoration(
                      color: lightMode == Brightness.light
                          ? Colors.grey.shade200
                          : Colors.blueGrey.withOpacity(.2),
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    "${data.sold} sold",
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              "\$${data.price}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
