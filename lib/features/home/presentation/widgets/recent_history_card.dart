import 'package:e_commerce_app/repository/recent_history_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class RecentHistoryCard extends StatelessWidget {
  const RecentHistoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecentHistoryRepository>(builder: (context, repository, child) {
      List<String> recentHistory = repository.getList;
      return Column(
        children: [
          Row(
            children: [
              Text(
                'Recent',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  if (recentHistory.isNotEmpty) {
                    //Clear all data recent history, set new data in SharedPreference
                    recentHistory.clear();
                    repository.setData(data: recentHistory);
                  }
                },
                borderRadius: BorderRadius.circular(12),
                child: Text(
                  'Clear All',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(kDefaultPadding),
          ),
          if (recentHistory.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: recentHistory.length,
                itemBuilder: (context, index) => Row(
                  children: [
                    Text(
                      recentHistory[index],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.cancel),
                    )
                  ],
                ),
              ),
            ),
        ],
      );
    });
  }
}
