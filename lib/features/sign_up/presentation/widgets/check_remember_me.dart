import 'package:flutter/material.dart';

class CheckRememberMe extends StatefulWidget {
  const CheckRememberMe({
    super.key,
  });

  @override
  State<CheckRememberMe> createState() => _CheckRememberMeState();
}

class _CheckRememberMeState extends State<CheckRememberMe> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: value,
            checkColor: Colors.white,
            fillColor:
                MaterialStateProperty.all(Colors.blueGrey.withOpacity(.4)),
            onChanged: (newValue) {
              setState(() {
                value = newValue!;
              });
            }),
        const Text('Remember me'),
      ],
    );
  }
}
