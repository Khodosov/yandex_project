import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/constants/constants.dart';
import 'package:yandex_project/domain/models/drink/drink.dart';
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
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) {
        return previous.favorites != current.favorites;
      },
      builder: (context, state) {
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
                        transitionOnUserGestures: true,
                        tag: drink.name,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppConstants.smallRadius),
                          child: Material(
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, '/drink', arguments: drink);
                              },
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
                                errorWidget: (context, url, error) {
                                  return const Icon(Icons.error_outline);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: -10,
                        child: BlurWidget(
                          borderRadius: const BorderRadius.all(Radius.circular(0)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: constraint.maxWidth,
                                  child: Hero(
                                    transitionOnUserGestures: true,
                                    tag: drink.id,
                                    child: DrinkTitleWidget(
                                      drink: drink,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Flexible(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: ListTile(
                    title: const Text('Ingredients'),
                    subtitle: Text(drink.ingredients.join(', '), overflow: TextOverflow.ellipsis,),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        );
      },
    );
  }
}
