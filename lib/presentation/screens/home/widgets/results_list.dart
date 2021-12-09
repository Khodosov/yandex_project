import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/presentation/widgets/drink_list_item.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ResultsList extends StatelessWidget {
  const ResultsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        if (!state.isRefreshing) {
          return ListView.builder(
            padding: padding.add(const EdgeInsets.only(bottom: 150)),
            itemCount: state.drinks.length,
            itemBuilder: (context, index) {
              return DrinkListItem(drink: state.drinks[index]);
            },
          );
        } else {
          return Center(child: PlatformCircularProgressIndicator());
        }
      },
    );
  }
}
