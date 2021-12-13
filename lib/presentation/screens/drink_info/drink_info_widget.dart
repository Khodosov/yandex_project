import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yandex_project/constants.dart';
import 'package:yandex_project/domain/models/drink/drink.dart';
import 'package:yandex_project/presentation/widgets/background_widget.dart';
import 'package:yandex_project/presentation/widgets/blur_widget.dart';
import 'package:yandex_project/presentation/widgets/custom_app_bar.dart';
import 'package:yandex_project/presentation/widgets/drink_title_widget.dart';

class DrinkInfoScreen extends StatelessWidget {
  const DrinkInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drink = ModalRoute.of(context)!.settings.arguments as Drink;
    final ingredientsWithMeasures = <Widget>[];
    for (int i = 0; i < drink.ingredients.length; i++) {
      final ingredient = drink.ingredients[i];
      String measure = 'up to you';
      if (i < drink.measures.length) {
        measure = drink.measures[i] ?? 'up to you';
      }
      ingredientsWithMeasures.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(ingredient ?? ''),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 3,
                  right: 10,
                  left: 10,
                ),
                child: Container(
                  color: Theme.of(context).primaryTextTheme.headline5?.color,
                  height: 0.1,
                ),
              ),
            ),
            Text(measure),
          ],
        ),
      );
    }
    return BackgroundWidget(
      child: Stack(
        children: [
          // Image
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Hero(
              tag: drink.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppConstants.smallRadius),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: drink.thumb ?? 'http://via.placeholder.com/350x150',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error_outline),
                ),
              ),
            ),
          ),
          // Information
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 390,
                ),
                Padding(
                  // padding from device edges
                  padding: const EdgeInsets.all(8.0),
                  child: BlurWidget(
                    top: false,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: DrinkTitleWidget(
                                  drink: drink,
                                ),
                              ),
                            ],
                          ),
                        ),
                        drink.category != null
                            ? ListTile(
                                title: const Text('Category'),
                                subtitle: Text(
                                  drink.category!,
                                  overflow: TextOverflow.visible,
                                ),
                              )
                            : const SizedBox.shrink(),
                        InkWell(
                          onTap: () {
                            // Copy ingredients to filter
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppConstants.smallRadius),
                                ),
                                duration: const Duration(milliseconds: 600),
                                content: const Text(
                                    'Ingredients copied NOT YET ACTUALLY :('),
                              ),
                            );
                          },
                          child: ListTile(
                            title: const Text('Ingredients'),
                            subtitle: Column(
                              children: ingredientsWithMeasures,
                            ),
                          ),
                        ),
                        drink.glass != null
                            ? ListTile(
                                title: const Text('Glass'),
                                subtitle: Text(
                                  drink.glass!,
                                  overflow: TextOverflow.visible,
                                ),
                              )
                            : const SizedBox.shrink(),
                        drink.alter != null
                            ? ListTile(
                                title: const Text('Alter'),
                                subtitle: Text(
                                  drink.alter!,
                                  overflow: TextOverflow.visible,
                                ),
                              )
                            : const SizedBox.shrink(),
                        drink.iba != null
                            ? ListTile(
                                title: const Text('Iba'),
                                subtitle: Text(
                                  drink.iba!,
                                  overflow: TextOverflow.visible,
                                ),
                              )
                            : const SizedBox.shrink(),
                        drink.instructions != null
                            ? ListTile(
                                title: const Text('Instruction'),
                                subtitle: Text(
                                  drink.instructions!,
                                  overflow: TextOverflow.visible,
                                ),
                              )
                            : const SizedBox.shrink(),
                        drink.attribute != null
                            ? ListTile(
                                title: const Text('Attribute'),
                                subtitle: Text(
                                  drink.attribute!,
                                  overflow: TextOverflow.visible,
                                ),
                              )
                            : const SizedBox.shrink(),
                        drink.commons != null
                            ? ListTile(
                                title: const Text('Commons'),
                                subtitle: Text(
                                  drink.commons!,
                                  overflow: TextOverflow.visible,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // "AppBar"
          CustomAppBar(
            title: Text(
              'Cocktail description',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}
