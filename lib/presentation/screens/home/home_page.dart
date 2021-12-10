import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/presentation/screens/home/widgets/bottom_bar.dart';
import 'package:yandex_project/presentation/screens/home/widgets/results_list.dart';
import 'package:yandex_project/presentation/screens/home/widgets/search_bar.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/presentation/widgets/blur_widget.dart';

import '../../../constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ResultsList(),
          BlurWidget(
            top: false,
            child: Container(
              height: 0,
            ),
          ),
          Positioned(
            bottom: 0,
            child: BlurWidget(
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
  }
}
