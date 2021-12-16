import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/constants/constants.dart';
import 'package:yandex_project/domain/general/enums.dart';
import 'package:yandex_project/domain/models/drink/drink.dart';

class DrinkTitleWidget extends StatelessWidget {
  final Drink drink;

  const DrinkTitleWidget({
    Key? key,
    required this.drink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) {
        return previous.favorites != current.favorites;
      },
      builder: (context, state) {
        final isFavor = state.favorites.contains(drink);
        return Material(
          color: Colors.transparent,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * 0.75,
                          child: Text(
                            drink.name,
                            style: const TextStyle(fontSize: AppConstants.titleFontSize),
                            overflow: TextOverflow.visible,
                          ),
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
                              child: Text(
                                drink.alcoholic != null ? drink.alcoholic!.fromEnum() : '-',
                                style: const TextStyle(
                                  fontSize: AppConstants.subtitleFontSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      iconSize: 35,
                      onPressed: () {
                        BlocProvider.of<SearchBloc>(context).add(SearchEvent.addToFavorites(drink: drink));
                      },
                      icon: Icon(
                        !isFavor ? Icons.favorite_border : Icons.favorite,
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        );
      },
    );
  }
}
