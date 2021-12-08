import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/presentation/widgets/drink_list_item.dart';

class ResultsList extends StatelessWidget {
  const ResultsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) {
        return previous.drinks != current.drinks;
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.drinks.length,
          itemBuilder: (context, index) {
            return DrinkListItem(drink: state.drinks[index]);
          },
        );
      },
    );
  }
}
