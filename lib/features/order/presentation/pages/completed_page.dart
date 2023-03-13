import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../data/simple_data.dart';
import '../widgets/on_going_card.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key, required this.isDarkMode});

  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
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
              pressButton: () {},
              textButton: 'Leave Review',
            ),
          )
        ],
      ),
    );
  }
}
