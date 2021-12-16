import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/constants/constants.dart';
import 'package:yandex_project/domain/exception/failures.dart';
import 'package:yandex_project/presentation/widgets/drink_item.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:yandex_project/presentation/widgets/not_found_widget.dart';
import 'package:yandex_project/presentation/widgets/page_dots_widget.dart';

class ResultsList extends StatefulWidget {
  const ResultsList({Key? key}) : super(key: key);

  @override
  State<ResultsList> createState() => _ResultsListState();
}

class _ResultsListState extends State<ResultsList> {
  final controller = PageController(
    viewportFraction: 0.94, // 0.9,
  );

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<SearchBloc>(context).add(const SearchEvent.randomSelectionCocktail());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) {
        return previous.drinks != current.drinks;
      },
      builder: (context, state) {
        final results = state.drinks.fold(
          (l) {
            String error = 'Error';
            if (l == const Failure.badConnection()){
              error = 'Bad connection';
            }
            if (l == const Failure.serverError()){
              error = 'Server Error';
            }
            Future.delayed(
              const Duration(milliseconds: 500),
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.smallRadius),
                    ),
                    duration: const Duration(milliseconds: 800),
                    content: Text(error),
                  ),
                );
              },
            );
          },
          (r) {
            return r;
          },
        );

        if (!state.isRefreshing) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 130, top: 40),
              child: state.drinks.isRight()
                  ? results!.isNotEmpty
                      ? Column(
                          children: [
                            PageDotsWidget(
                              pageController: controller,
                              pageCount: results.length,
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            Flexible(
                              flex: 17,
                              child: PageView.builder(
                                controller: controller,
                                padEnds: results.length == 1 ? true : false,
                                itemCount: results.length,
                                itemBuilder: (context, index) {
                                  return DrinkItem(drink: results[index]);
                                },
                              ),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                          ],
                        )
                      : const SizedBox.shrink()
                  : const NotFoundWidget(),
            ),
          );
        } else {
          return Center(child: PlatformCircularProgressIndicator());
        }
      },
    );
  }
}
