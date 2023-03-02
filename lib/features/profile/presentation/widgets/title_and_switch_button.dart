// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class TitleAndSwitchButton extends StatefulWidget {
  const TitleAndSwitchButton({
    Key? key,
    
    required this.text,
    required this.switchValue,
  }) : super(key: key);
  
  final String text;
  final bool switchValue;

  @override
  State<TitleAndSwitchButton> createState() => _DarkModeItemState();
}

class _DarkModeItemState extends State<TitleAndSwitchButton> {
  @override
  Widget build(BuildContext context) {
    bool switchValue = widget.switchValue;
    return Container(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(kDefaultPadding),
          right: kDefaultPadding / 2),
      width: double.infinity,
      child: Row(
        children: [
         
          SizedBox(
            width: getProportionateScreenWidth(kDefaultPadding / 2),
          ),
          Expanded(child: Text(widget.text)),
          Switch(
            value: switchValue,
            activeColor: Colors.white,
            activeTrackColor: Colors.grey,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey,
            onChanged: (newValue) {
              setState(() {
                switchValue = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
