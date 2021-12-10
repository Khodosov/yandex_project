import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yandex_project/constants.dart';
import 'package:yandex_project/domain/models/drink.dart';
import 'package:yandex_project/presentation/widgets/blur_widget.dart';

class DrinkInfoScreen extends StatelessWidget {
  const DrinkInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drink = ModalRoute.of(context)!.settings.arguments as Drink;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.zero,
        child:  BlurWidget(
          child: SizedBox(height: 0,),
        ),
      ),
      body: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.smallRadius),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: drink.thumb ?? 'http://via.placeholder.com/350x150',
              progressIndicatorBuilder: (context, url, downloadProgress) => Center(
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
              errorWidget: (context, url, error) => const Icon(Icons.error_outline),
            ),
          ),
        ],
      ),
    );
  }
}
