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
    final leading = CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: widget.drink.thumb ?? 'http://via.placeholder.com/350x150',
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );

    final ingredients = StringBuffer();
    ingredients.writeAll(widget.drink.ingredients, ', ');
    return SizedBox(
      height: 150,
      // width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            setState(() {
              rolled = !rolled;
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              leading,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            widget.drink.name,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: AnimatedCrossFade(
                            crossFadeState: rolled ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                            firstChild: Text(widget.drink.alcoholic ?? ''),
                            secondChild: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.drink.alcoholic ?? ''),
                                widget.drink.alter != null
                                    ? Text(widget.drink.alter!)
                                    : Container(),
                                widget.drink.category != null ? Text(widget.drink.category!) : Container(),
                                widget.drink.glass != null ? Text(widget.drink.glass!) : Container(),
                                Text(ingredients.toString()),
                              ],
                            ),
                            duration: const Duration(milliseconds: 300),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}
