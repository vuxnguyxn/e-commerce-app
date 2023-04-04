import 'package:flutter/material.dart';

import '../../../../core/size_config.dart';

class DotColor extends StatelessWidget {
  const DotColor({
    Key? key,
    required this.currentIndex, required this.length,
  }) : super(key: key);

  final int currentIndex;
  final int length;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Container(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          length,
          (index) => AnimatedContainer(
            margin: EdgeInsets.only(right: getProportionateScreenWidth(8)),
            duration: const Duration(seconds: 1),
            height: 6,
            width: currentIndex == index ? 20 : 6,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: isDarkMode
                  ? (currentIndex == index ? Colors.white : Colors.black)
                  : (currentIndex == index ? Colors.black : Colors.white),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white, width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
