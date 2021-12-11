import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/constants.dart';
import 'package:yandex_project/domain/models/drink.dart';
import 'package:yandex_project/presentation/widgets/drink_title_widget.dart';

import 'blur_widget.dart';

class DrinkItem extends StatelessWidget {
  final Drink drink;

  const DrinkItem({
    Key? key,
    required this.drink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(buildWhen: (previous, current) {
      return previous.favorites != current.favorites;
    }, builder: (context, state) {
      final isFavor = state.favorites.contains(drink);
      return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.smallRadius)),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LayoutBuilder(
              builder: (context, constraint) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Hero(
                      tag: drink.name,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppConstants.smallRadius),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: drink.thumb ?? 'http://via.placeholder.com/350x150',
                          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                            child: SizedBox(
                              height: constraint.maxWidth,
                              width: constraint.maxWidth,
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                  color: Theme.of(context).iconTheme.color,
                                ),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => const Icon(Icons.error_outline),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      child: BlurWidget(
                        borderRadius: const BorderRadius.all(Radius.circular(0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: constraint.maxWidth,
                            child: DrinkTitleWidget(
                              drink: drink,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text('Ingredients'),
                      subtitle: Text(
                        drink.ingredients.join(', '),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    drink.glass != null
                        ? ListTile(
                            title: const Text('Glass'),
                            subtitle: Text(
                              drink.glass!,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  iconSize: 35,
                  onPressed: () {
                    BlocProvider.of<SearchBloc>(context).add(SearchEvent.addToFavorites(drink: drink));
                  },
                  icon: Icon(
                    !isFavor ? Icons.favorite_border : Icons.favorite,
                  ),
                ),
                IconButton(
                  iconSize: 35,
                  onPressed: () {
                    Navigator.pushNamed(context, '/drink', arguments: drink);
                  },
                  icon: const Icon(
                    Icons.info_outline,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      );
    });
  }
}
