import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/presentation/screens/home/widgets/bottom_bar.dart';
import 'package:yandex_project/presentation/screens/home/widgets/results_list.dart';
import 'package:yandex_project/presentation/screens/home/widgets/search_bar.dart';
import 'package:yandex_project/presentation/widgets/blur_widget.dart';
import 'package:yandex_project/application/navigation/navigation_bloc.dart';

import '../../../constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(buildWhen: (previous, current) {
      return previous != current;
    }, builder: (context, state) {
      return Scaffold(
        body: Stack(
          children: [
            const ResultsList(),
            Positioned(
              right: 0,
              left: 0,
              child: BlurWidget(
                bottom: false,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.tab.toString().split('.').last),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: BlurWidget(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(AppConstants.smallRadius),
                  topLeft: Radius.circular(AppConstants.smallRadius),
                ),
                top: false,
                child: Column(
                  children: const [
                    SearchBar(),
                    CustomBottomBar(),
                  ],
                ),
              ),
            ),
          ],
        ),
        // bottomNavigationBar: const CustomBottomBar(),
      );
    });
  }
}
