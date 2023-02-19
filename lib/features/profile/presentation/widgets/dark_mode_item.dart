import 'package:e_commerce_app/features/profile/presentation/blocs/switch_bloc/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants.dart';
import '../../../../core/size_config.dart';

class DarkModeItem extends StatefulWidget {
  const DarkModeItem({
    super.key,
  });

  @override
  State<DarkModeItem> createState() => _DarkThemeItemState();
}

class _DarkThemeItemState extends State<DarkModeItem> {
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(kDefaultPadding),
          right: kDefaultPadding / 2),
      width: double.infinity,
      child: Row(
        children: [
          const Icon(Icons.dark_mode),
          SizedBox(
            width: getProportionateScreenWidth(kDefaultPadding / 2),
          ),
          const Expanded(child: Text('Dark Mode')),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Switch(
                value: state.switchValue,
                activeColor: Colors.white,
                activeTrackColor: Colors.grey,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey,
                onChanged: (newValue) {
                  setState(() {
                    newValue
                        ? context.read<SwitchBloc>().add(SwitchOnEvent())
                        : context.read<SwitchBloc>().add(SwitchOffEvent());
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
