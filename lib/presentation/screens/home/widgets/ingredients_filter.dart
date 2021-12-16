import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/domain/models/filter/filter.dart';
import 'package:yandex_project/domain/models/ingredient/ingredient.dart';

class IngredientsFilter extends StatefulWidget {
  final List<Ingredient> ingredients;

  const IngredientsFilter({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  @override
  _IngredientsFilterState createState() => _IngredientsFilterState();
}

class _IngredientsFilterState extends State<IngredientsFilter> {
  bool rolled = true;

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
            title: const Text('Ingredients'),
            onTap: (){
              setState(() {
                rolled = !rolled;
              });
            },
          ),
        ];
        for (final ingredient in widget.ingredients) {
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
        return AnimatedCrossFade(
          firstChild: children.first,
          secondChild: Column(
            children: children,
          ),
          crossFadeState: rolled ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 400),
        );
      },
    );
  }
}
