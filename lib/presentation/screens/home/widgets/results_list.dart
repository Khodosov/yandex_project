import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/presentation/widgets/drink_item.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ResultsList extends StatefulWidget {
  const ResultsList({Key? key}) : super(key: key);

  @override
  State<ResultsList> createState() => _ResultsListState();
}

class _ResultsListState extends State<ResultsList> {
  final controller = PageController(
    viewportFraction: 0.90,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        if (!state.isRefreshing) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 140, top: 40),
              child: PageView.builder(
                controller: controller,
                padEnds: state.drinks.length == 1 ? true : false,
                itemCount: state.drinks.length,
                itemBuilder: (context, index) {
                  return DrinkItem(drink: state.drinks[index]);
                },
              ),
            ),
          );
        } else {
          return Center(child: PlatformCircularProgressIndicator());
        }
      },
    );
  }
}
