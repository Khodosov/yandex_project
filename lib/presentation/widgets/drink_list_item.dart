import 'package:flutter/material.dart';
import 'package:yandex_project/domain/models/drink.dart';

class DrinkListItem extends StatefulWidget {
  final Drink drink;

  const DrinkListItem({Key? key, required this.drink}) : super(key: key);

  @override
  _DrinkListItemState createState() => _DrinkListItemState();
}

class _DrinkListItemState extends State<DrinkListItem> {
  @override
  Widget build(BuildContext context) {
    final image = SizedBox(
      width: 100,
      height: 100,
      child: widget.drink.strImageSource != null ? Image(image: NetworkImage(widget.drink.strImageSource!)) : const Placeholder(),
    );

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(8),
        child: ListTile(
          leading: image,
          title: Text(widget.drink.strDrink),
          subtitle: Text(widget.drink.strAlcoholic ?? ''),
        ),
      ),
    );
  }
}
