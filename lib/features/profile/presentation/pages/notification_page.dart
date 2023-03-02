import 'package:e_commerce_app/features/profile/data/simple_data.dart';
import 'package:e_commerce_app/features/profile/presentation/widgets/title_and_switch_button.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static const String route = '/notifications';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(
                itemsNotification.length,
                (index) => TitleAndSwitchButton(
                    text: itemsNotification[index], switchValue: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
