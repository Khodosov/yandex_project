import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/navigation/navigation_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/constants/constants.dart';
import 'package:yandex_project/domain/general/enums.dart';
import 'package:yandex_project/presentation/screens/home/widgets/filters_widget.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool rolled = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      buildWhen: (previous, current) {
        if (current.tab == AppTab.search) {
          setState(() {
            rolled = false;
          });
        } else {
          setState(() {
            rolled = true;
          });
        }
        return previous.tab != current.tab;
      },
      builder: (context, state) {
        return BlocBuilder<SearchBloc, SearchState>(
          buildWhen: (previous, current){
            return previous.isConnected != current.isConnected;
          },
          builder: (context, state) {
            return GestureDetector(
              onPanUpdate: (details) async {
                if (details.delta.dy > 0) {
                  BlocProvider.of<NavigationBloc>(context).add(
                    NavigationEvent.changeTab(tab: AppTab.search, context: context),
                  );
                  setState(() {
                    rolled = true;
                  });
                }
                if (details.delta.dy < 0) {
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigationEvent.changeTab(tab: AppTab.search, context: context));
                  setState(() {
                    rolled = false;
                  });
                }
              },
              behavior: HitTestBehavior.translucent,
              child: AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                crossFadeState: !rolled ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                firstChild: state.isConnected ? searchLine(context) : const SizedBox.shrink(),
                secondChild: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    state.isConnected ? searchLine(context) : const SizedBox.shrink(),
                    const FilterWidget(),
                  ],
                ),
              ),
            );
          }
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
        height: 40,
        width: MediaQuery.of(context).size.width - 16,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: TextField(
            onTap: () async {
              final connection = await Connectivity().checkConnectivity();
              if (connection != ConnectivityResult.none) {
                BlocProvider.of<NavigationBloc>(context)
                    .add(NavigationEvent.changeTab(tab: AppTab.search, context: context));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.smallRadius),
                    ),
                    duration: const Duration(milliseconds: 800),
                    content: const Text('No internet connection.'),
                  ),
                );
              }
            },
            cursorColor: Theme.of(context).iconTheme.color,
            cursorHeight: 13,
            style: const TextStyle(fontSize: 14),
            scrollPadding: EdgeInsets.zero,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: -12.0, horizontal: 0.0),
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).iconTheme.color,
                ),
                border: InputBorder.none),
            onChanged: (text) async {
              final filter = context.read<SearchBloc>().state.filter;
              BlocProvider.of<SearchBloc>(context).add(
                SearchEvent.updateFilter(
                  filter: filter.copyWith(
                    name: text,
                  ),
                ),
              );
              BlocProvider.of<SearchBloc>(context).add(const SearchEvent.searchByFilter());
            },
          ),
        ),
      ),
    );
  }
}
