import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/constants/constants.dart';
import 'package:yandex_project/domain/models/filter/filter.dart';
import 'package:yandex_project/domain/models/ingredient/ingredient.dart';

class IngredientsFilter extends StatelessWidget {
  final List<Ingredient> ingredients;

  const IngredientsFilter({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  void onFilterUpdate(BuildContext context, Filter filter) {
    BlocProvider.of<SearchBloc>(context).add(SearchEvent.updateFilter(filter: filter));
    BlocProvider.of<SearchBloc>(context).add(const SearchEvent.searchByFilter());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        final children = <Widget>[
          ListTile(
            trailing: Material(
              borderRadius: BorderRadius.circular(AppConstants.smallRadius),
              color: Colors.grey,
              child: InkWell(
                borderRadius: BorderRadius.circular(AppConstants.smallRadius),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Clear'),
                ),
                onTap: () {
                  onFilterUpdate(
                    context,
                    state.filter.copyWith(
                      ingredients: [],
                    ),
                  );
                },
              ),
            ),
            title: const Text('Ingredients'),
          ),
        ];
        for (final ingredient in ingredients) {
          children.add(
            CheckboxListTile(
              title: Text(ingredient.name),
              value: (state.filter.ingredients ?? []).contains(ingredient),
              onChanged: (value) {
                final List<Ingredient> ingredients = List.from(state.filter.ingredients ?? []);
                if (!(state.filter.ingredients ?? []).contains(ingredient)) {
                  ingredients.add(ingredient);
                } else {
                  ingredients.remove(ingredient);
                }
                onFilterUpdate(
                  context,
                  state.filter.copyWith(
                    ingredients: ingredients,
                  ),
                );
              },
            ),
          );
        }
        return Column(
          children: children,
        );
      },
    );
  }
}
