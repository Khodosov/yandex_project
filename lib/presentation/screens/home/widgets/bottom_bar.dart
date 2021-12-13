import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/navigation/navigation_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/constants/constants.dart';
import 'package:yandex_project/domain/general/enums.dart';
import 'package:yandex_project/domain/models/filter/filter.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      buildWhen: (previous, current) {
        return previous.tab != current.tab;
      },
      builder: (context, state) {
        return LayoutBuilder(builder: (context, constraint) {
          return SizedBox(
            width: constraint.maxWidth,
            height: constraint.maxWidth / 5.5,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstants.bigRadius)),
              margin: const EdgeInsets.all(8),
              // color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  tabIcon(
                    selected: state.tab == AppTab.favorites,
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context).add(
                          NavigationEvent.changeTab(
                              tab: AppTab.favorites, context: context));
                    },
                    icon: Icons.favorite,
                    context: context,
                  ),
                  tabIcon(
                    selected: state.tab == AppTab.random,
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context).add(
                          NavigationEvent.changeTab(
                              tab: AppTab.random, context: context));
                      BlocProvider.of<SearchBloc>(context)
                          .add(const SearchEvent.updateFilter(filter: Filter()));
                      BlocProvider.of<SearchBloc>(context)
                          .add(const SearchEvent.randomSelectionCocktail());
                    },
                    icon: Icons.casino,
                    context: context,
                  ),
                  // tabIcon(
                  //   selected: state.tab == AppTab.home,
                  //   onTap: () {
                  //     BlocProvider.of<NavigationBloc>(context).add(
                  //         NavigationEvent.changeTab(
                  //             tab: AppTab.home, context: context));
                  //   },
                  //   icon: Icons.house,
                  //   context: context,
                  // ),
                  tabIcon(
                    selected: state.tab == AppTab.search,
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context).add(
                          NavigationEvent.changeTab(
                              tab: AppTab.search, context: context));
                    },
                    icon: Icons.search,
                    context: context,
                  ),
                  tabIcon(
                    selected: state.tab == AppTab.settings,
                    onTap: () {
                      BlocProvider.of<NavigationBloc>(context).add(
                          NavigationEvent.changeTab(
                              tab: AppTab.settings, context: context));
                    },
                    icon: Icons.settings,
                    context: context,
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Widget tabIcon({
    required void Function() onTap,
    required IconData icon,
    required BuildContext context,
    required bool selected,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color:
            !selected ? Colors.transparent : Theme.of(context).iconTheme.color,
        borderRadius: BorderRadius.circular(AppConstants.smallRadius),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: selected
              ? Theme.of(context).cardColor
              : Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
