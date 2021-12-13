import 'package:flutter/material.dart';
import 'package:yandex_project/constants.dart';
import 'package:yandex_project/domain/models/drink/drink.dart';

class DrinkTitleWidget extends StatelessWidget {
  final Drink drink;

  const DrinkTitleWidget({
    Key? key,
    required this.drink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          drink.name,
          style: const TextStyle(fontSize: AppConstants.titleFontSize),
          overflow: TextOverflow.visible,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.smallRadius),
              color: Theme.of(context).cardColor.withOpacity(0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text('${drink.alcoholic}' ?? '-'),
            ),
          ),
        ),
      ],
    );
  }
}
