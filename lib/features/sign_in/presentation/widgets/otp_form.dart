import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({super.key});

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
  FocusNode? pin2FocusNode, pin3FocusNode, pin4FocusNode;
  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    super.dispose();
  }

  void nextFile({String? value, FocusNode? focusNode}) {
    if (value!.length == 1) {
      focusNode!.requestFocus();
    }
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
      borderSide: BorderSide(color: Colors.blueGrey.withOpacity(.2)),
    );
  }
  
  OutlineInputBorder outlineInputFocusBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
      borderSide: const BorderSide(color: kTextColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    final otpInputDecoration = InputDecoration(
      contentPadding:
          EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
      border: outlineInputBorder(),
      focusedBorder: outlineInputFocusBorder(),
      enabledBorder: outlineInputBorder(),
    );
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: getProportionateScreenWidth(60),
            child: TextFormField(
              autofocus: true,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: otpInputDecoration,
              onChanged: (value) {
                nextFile(value: value, focusNode: pin2FocusNode);
              },
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(60),
            child: TextFormField(
              focusNode: pin2FocusNode,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: otpInputDecoration,
              onChanged: (value) {
                nextFile(value: value, focusNode: pin3FocusNode);
              },
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(60),
            child: TextFormField(
              focusNode: pin3FocusNode,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: otpInputDecoration,
              onChanged: (value) {
                nextFile(value: value, focusNode: pin4FocusNode);
              },
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(60),
            child: TextFormField(
              focusNode: pin4FocusNode,
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: otpInputDecoration,
              onChanged: (value) {
                pin4FocusNode!.unfocus();
              },
            ),
          ),
        ],
      ),
    );
  }
}
