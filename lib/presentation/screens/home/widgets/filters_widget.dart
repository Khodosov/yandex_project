import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/domain/models/filter/filter.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({Key? key}) : super(key: key);

  void onFilterUpdate(BuildContext context, Filter filter){
    BlocProvider.of<SearchBloc>(context).add(SearchEvent.updateFilter(filter: filter));
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current){
        return previous.filter != current.filter;
      },
      builder: (context, state) {
        ///
        /// Preparing filter items
        ///
        final filters = <Widget>[];
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
                  label: const Text('Alcoholic'),
                  selected: true,
                  onSelected: (selected) {
                    if (selected) {
                    } else {}
                  },
                  selectedColor: Colors.amber,
                ),
                InputChip(
                  label: const Text('Non alcoholic'),
                  selected: false,
                  onSelected: (selected) {
                    if (selected) {
                    } else {}
                  },
                  selectedColor: Colors.amber,
                ),
                InputChip(
                  label: const Text('Optional alcohol'),
                  selected: true,
                  onSelected: (selected) {
                    if (selected) {
                    } else {}
                  },
                  selectedColor: Colors.amber,
                ),
              ],
            ),
          ),
        );
        // for (final ingredient in ingredients){
        //   filters.add();
        // }
        filters.add(
          CheckboxListTile(
            title: const Text('Ingredient'),
            value: false,
            onChanged: (value) {
              print(value);
            },
          ),
        );
        return LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxWidth / 1.5,
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
  }
}
