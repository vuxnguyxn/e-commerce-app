import 'package:flutter/material.dart';

class HorizonLine extends StatelessWidget {
  const HorizonLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.blueGrey.withOpacity(.2),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
    );
  }
}
