import 'package:cure_team_2/core/constants/assets.dart';
import 'package:cure_team_2/features/Search_by_location_Doctor/widgets/option_item.dart';
import 'package:flutter/material.dart';

class OptionsRowSection extends StatelessWidget {
  const OptionsRowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OptionItem(
          assets: Assets.sort,
          text: 'Sort',
        ),
        OptionItem(
          assets: Assets.filter,
          text: 'Filter',
        ),
        OptionItem(
          assets: Assets.map,
          text: 'map',
        ),
      ],
    );
  }
}
