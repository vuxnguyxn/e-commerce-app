import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/features/wallet/data/simple_data.dart';
import 'package:e_commerce_app/features/wallet/presentation/widgets/transaction_history_card.dart';
import 'package:flutter/material.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  static const String route = '/transaction_history';

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transaction History',
          style: TextStyle(fontSize: 20),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              dataTransactionHistory.length,
              (index) => TransactionHistoryCard(
                  data: dataTransactionHistory[index],
                  isDarkMode: isDarkMode),
            ),
          ],
        ),
      ),
    );
  }
}
