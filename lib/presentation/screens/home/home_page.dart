import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/presentation/screens/home/widgets/results_list.dart';
import 'package:yandex_project/presentation/screens/home/widgets/search_bar.dart';
import 'package:yandex_project/application/search/search_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ResultsList(),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ColoredBox(
                color: Colors.black12,
                child: SafeArea(
                  top: false,
                  child: Stack(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 40.0,
                          sigmaY: 40.0,
                        ),
                        child: ColoredBox(
                          color: Colors.black.withOpacity(0),
                        ),
                      ),
                      Column(
                        children: [
                          const SearchBar(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width / 5.5,
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                              margin: const EdgeInsets.all(8),
                              // color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.favorite),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.menu),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      BlocProvider.of<SearchBloc>(context).add(const SearchEvent.randomCocktail());
                                      // Navigator.pushNamed(context, '/random');
                                    },
                                    icon: const Icon(Icons.casino),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/settings');
                                    },
                                    icon: const Icon(Icons.settings),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
