import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yandex_project/domain/models/drink.dart';

class DrinkListItem extends StatefulWidget {
  final Drink drink;

  const DrinkListItem({Key? key, required this.drink}) : super(key: key);

  @override
  _DrinkListItemState createState() => _DrinkListItemState();
}

class _DrinkListItemState extends State<DrinkListItem> {
  bool rolled = true;

  @override
  Widget build(BuildContext context) {
    final leading = SizedBox(
      width: 55,
      height: 55,
      child: CachedNetworkImage(
        imageUrl: widget.drink.strImageSource ?? '',
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );

    final ingredients = StringBuffer();
    ingredients.writeAll(widget.drink.getIngredients(), ', ');

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            Flexible(
              child: InkWell(
                onTap: () {
                  setState(() {
                    rolled = !rolled;
                  });
                },
                borderRadius: rolled ? const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ) : BorderRadius.circular(20),
                child: ListTile(
                  leading: leading,
                  title: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      widget.drink.strDrink,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: AnimatedCrossFade(
                      crossFadeState: rolled ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                      firstChild: Text(widget.drink.strAlcoholic ?? ''),
                      secondChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.drink.strAlcoholic ?? ''),
                          widget.drink.strDrinkAlternate != null ? Text(widget.drink.strDrinkAlternate!) : Container(),
                          widget.drink.strCategory != null ? Text(widget.drink.strCategory!) : Container(),
                          widget.drink.strGlass != null ? Text(widget.drink.strGlass!) : Container(),
                          Text(ingredients.toString()),
                        ],
                      ),
                      duration: const Duration(milliseconds: 200),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    // isn't const due to further state changes
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.read_more),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
