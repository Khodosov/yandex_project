import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yandex_project/constants.dart';
import 'package:yandex_project/domain/models/drink.dart';

import 'blur_widget.dart';

class DrinkItem extends StatelessWidget {
  final Drink drink;

  const DrinkItem({
    Key? key,
    required this.drink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.smallRadius)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  ClipRRect(
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
                  Positioned(
                    bottom: -30,
                    child: BlurWidget(
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                      child: SizedBox(
                        height: 60,
                        width: constraint.maxWidth,
                        child: Center(
                          child: Text(
                            drink.name,
                            style: const TextStyle(fontSize: AppConstants.titleFontSize),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 30),
                  child: Chip(
                    backgroundColor: Theme.of(context).cardColor.withOpacity(0),
                    label: Text(drink.alcoholic ?? '-'),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                iconSize: 35,
                onPressed: () {},
                // isn't const due to further state changes
                icon: Icon(
                  Icons.favorite_border,
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
            height: 10,
          )
        ],
      ),
    );
  }
}
