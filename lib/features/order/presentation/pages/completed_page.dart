import 'package:e_commerce_app/features/order/presentation/widgets/order_completed_detail_card.dart';
import 'package:e_commerce_app/widgets/custom_button.dart';
import 'package:e_commerce_app/widgets/horizon_line.dart';
import 'package:e_commerce_app/widgets/short_horizon_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../data/simple_data.dart';
import '../widgets/on_going_card.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key, required this.isDarkMode});

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    void showLeaveReviewModelBottomSheet({required Order data}) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (builder) {
          return Container(
            width: double.infinity,
            height: SizeConfig.screenHeight * .7,
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(kDefaultPadding)),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: isDarkMode ? kContentColorLightTheme : Colors.white,
            ),
            child: Column(
              children: [
                const ShortHorizonLine(),
                Text(
                  'Leave a Review',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      fontWeight: FontWeight.bold),
                ),
                const HorizonLine(),
                OrderCompletedDetailCard(isDarkMode: isDarkMode, data: data),
                const HorizonLine(),
                SizedBox(
                  height: getProportionateScreenWidth(kDefaultPadding),
                ),
                Text(
                  'How is your order?',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(kDefaultPadding / 2),
                ),
                Text(
                  'Please give your rating and also your review...',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(kDefaultPadding),
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: kDefaultPadding/4),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    size: 8,
                    color: isDarkMode ? Colors.white :Colors.black,
                  ),
                  onRatingUpdate: (rating) {
                    
                  },
                ),
                SizedBox(
                  height: getProportionateScreenWidth(kDefaultPadding),
                ),
                Container(
                  padding: const EdgeInsets.only(left: kDefaultPadding / 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: isDarkMode ? Colors.white :Colors.black),
                  ),
                  child: const TextField(
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: 'Enter your review!',
                      suffixIcon: Icon(Icons.collections),
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(kDefaultPadding),
                ),
                const HorizonLine(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                        title: "Cancel",
                        color: isDarkMode ?  Colors.blueGrey.withOpacity(.2) : Colors.blueGrey.withOpacity(.2),
                        colorText: isDarkMode ? Colors.white: Colors.black,
                        press: () {}),
                    CustomButton(
                        title: "Submit",
                        color:isDarkMode? Colors.white: Colors.black,
                        colorText:isDarkMode? Colors.black:Colors.white,
                        press: () {}),
                  ],
                ),
                const Spacer(),
              ],
            ),
          );
        },
      );
    }

    return Container(
      width: double.infinity,
      margin:
          EdgeInsets.only(top: getProportionateScreenWidth(kDefaultPadding)),
      child: Column(
        children: [
          ...List.generate(
            dataOrder.length,
            (index) => OngoingCard(
              isDarkMode: isDarkMode,
              data: dataOrder[index],
              pressButton: () =>
                  showLeaveReviewModelBottomSheet(data: dataOrder[index]),
              textButton: 'Leave Review',
            ),
          )
        ],
      ),
    );
  }
}
