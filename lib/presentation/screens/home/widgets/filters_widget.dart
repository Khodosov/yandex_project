import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/constants/constants.dart';
import 'package:yandex_project/domain/general/enums.dart';
import 'package:yandex_project/domain/models/filter/filter.dart';
import 'package:yandex_project/application/preferences/preferences_bloc.dart';
import 'package:yandex_project/presentation/screens/home/widgets/ingredients_filter.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  void onFilterUpdate(BuildContext context, Filter filter) {
    BlocProvider.of<SearchBloc>(context).add(SearchEvent.updateFilter(filter: filter));
    BlocProvider.of<SearchBloc>(context).add(const SearchEvent.searchByFilter());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(buildWhen: (previous, current) {
      return previous.nonAlcoholicMode != current.nonAlcoholicMode;
    }, builder: (context, state) {
      final alcoholicMode = !state.nonAlcoholicMode;
      return BlocBuilder<SearchBloc, SearchState>(
        buildWhen: (previous, current) {
          return previous.filter != current.filter || previous.ingredients != current.ingredients;
        },
        builder: (context, state) {
          ///
          /// Preparing filter items
          ///
          final filters = <Widget>[];
          ///
          /// Show popular list
          ///
          filters.add(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Material(
                      color: Colors.orange.shade700,
                      borderRadius: BorderRadius.circular(AppConstants.smallRadius),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(AppConstants.smallRadius),
                        onTap: (){
                          BlocProvider.of<SearchBloc>(context).add(const SearchEvent.popularCocktails());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 18),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:const  [
                              Icon(Icons.star),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 8),
                                child: Text('Popular'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Material(
                      color: Colors.orange.shade700,
                      borderRadius: BorderRadius.circular(AppConstants.smallRadius),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(AppConstants.smallRadius),
                        onTap: (){
                          BlocProvider.of<SearchBloc>(context).add(const SearchEvent.latestCocktails());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 18),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:const  [
                              Icon(Icons.schedule),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 8),
                                child: Text('Latest'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
          ///
          /// Show latest
          ///

          filters.add(const Divider(endIndent: 20, indent: 20,));
          filters.add(
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Wrap(
                spacing: 10,
                runSpacing: 1,
                children: [
                  InputChip(
                    isEnabled: alcoholicMode,
                    label: const Text('Alcoholic'),
                    selected: alcoholicMode && (state.filter.drinkType ?? []).contains(DrinkType.alcoholic),
                    onSelected: (selected) {
                      if (selected) {
                        final List<DrinkType> types = List.from(state.filter.drinkType ?? []);
                        types.add(DrinkType.alcoholic);
                        onFilterUpdate(
                          context,
                          state.filter.copyWith(
                            drinkType: types,
                          ),
                        );
                      } else {
                        final List<DrinkType> types = List.from(state.filter.drinkType ?? []);
                        types.remove(DrinkType.alcoholic);
                        onFilterUpdate(
                          context,
                          state.filter.copyWith(
                            drinkType: types,
                          ),
                        );
                      }
                    },
                    selectedColor: Colors.orange.shade700,
                  ),
                  InputChip(
                    label: const Text('Non alcoholic'),
                    selected: (state.filter.drinkType ?? []).contains(DrinkType.nonAlcoholic),
                    onSelected: (selected) {
                      if (selected) {
                        final List<DrinkType> types = List.from(state.filter.drinkType ?? []);
                        types.add(DrinkType.nonAlcoholic);
                        onFilterUpdate(
                          context,
                          state.filter.copyWith(
                            drinkType: types,
                          ),
                        );
                      } else {
                        final List<DrinkType> types = List.from(state.filter.drinkType ?? []);
                        types.remove(DrinkType.nonAlcoholic);
                        onFilterUpdate(
                          context,
                          state.filter.copyWith(
                            drinkType: types,
                          ),
                        );
                      }
                    },
                    selectedColor: Colors.orange.shade700,
                  ),
                  InputChip(
                    isEnabled: alcoholicMode,
                    label: const Text('Optional alcohol'),
                    selected: alcoholicMode && (state.filter.drinkType ?? []).contains(DrinkType.optionalAlcohol),
                    onSelected: (selected) {
                      if (selected) {
                        final List<DrinkType> types = List.from(state.filter.drinkType ?? []);
                        types.add(DrinkType.optionalAlcohol);
                        onFilterUpdate(
                          context,
                          state.filter.copyWith(
                            drinkType: types,
                          ),
                        );
                      } else {
                        final List<DrinkType> types = List.from(state.filter.drinkType ?? []);
                        types.remove(DrinkType.optionalAlcohol);
                        onFilterUpdate(
                          context,
                          state.filter.copyWith(
                            drinkType: types,
                          ),
                        );
                      }
                    },
                    selectedColor: Colors.orange.shade700,
                  ),
                ],
              ),
            ),
          );
          filters.add(
            IngredientsFilter(ingredients: state.ingredients),
          );
          return LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxWidth / 1.3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: filters,
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    });
  }
}
