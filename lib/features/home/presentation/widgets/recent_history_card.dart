import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';
import '../../data/simple_data.dart';

class RecentHistoryCard extends StatelessWidget {
  const RecentHistoryCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
                onTap: () {},
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
          Expanded(
            child: ListView.builder(
              itemCount: historySearch.length,
              itemBuilder: (context, index) => Row(
                children: [
                  Text(
                    historySearch[index],
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
      ),
    );
  }
}
