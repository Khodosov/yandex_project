import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/navigation/navigation_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/constants.dart';
import 'package:yandex_project/domain/general/enums.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      buildWhen: (previous, current) {
        return previous.tab != current.tab;
      },
      builder: (context, state) {
        return AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: state.tab == AppTab.search ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          firstChild: searchLine(context),
          secondChild: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              searchLine(context),
              const Placeholder(),
            ],
          ),
        );
      },
    );
  }

  Widget searchLine(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.bigRadius)),
      margin: const EdgeInsets.all(8),
      elevation: 5,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 16,
        height: 40,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: TextFormField(
            cursorHeight: 15,
            cursorColor: Theme.of(context).iconTheme.color,
            scrollPadding: EdgeInsets.zero,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).iconTheme.color,
                ),
                border: InputBorder.none),
            onChanged: (text) {
              BlocProvider.of<SearchBloc>(context).add(SearchEvent.searchByName(name: text));
            },
          ),
        ),
      ),
    );
  }
}
