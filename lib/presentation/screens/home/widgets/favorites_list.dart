import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/presentation/widgets/drink_item.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:yandex_project/presentation/widgets/not_found_widget.dart';

class FavoritesList extends StatefulWidget {
  const FavoritesList({Key? key}) : super(key: key);

  @override
  State<FavoritesList> createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  final controller = PageController(
    viewportFraction: 0.96,
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
        return previous.favorites != current.favorites;
      },
      builder: (context, state) {
        if (!state.isRefreshing) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 130, top: 40),
              child: state.favorites.isNotEmpty ? PageView.builder(
                controller: controller,
                padEnds: state.favorites.length == 1 ? true : false,
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  return DrinkItem(drink: state.favorites[index]);
                },
              ) : const NotFoundWidget(),
            ),
          );
        } else {
          return Center(child: PlatformCircularProgressIndicator());
        }
      },
    );
  }
}
