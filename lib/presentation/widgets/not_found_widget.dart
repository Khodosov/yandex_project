import 'package:flutter/material.dart';
import 'package:yandex_project/presentation/widgets/background_widget.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            r'\(^Д^)/',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 4,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Nothing found',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
