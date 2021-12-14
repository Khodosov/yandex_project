import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'package:vibration/vibration.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/domain/general/enums.dart';
import 'package:yandex_project/presentation/screens/home/widgets/bottom_bar.dart';
import 'package:yandex_project/presentation/screens/home/widgets/favorites_list.dart';
import 'package:yandex_project/presentation/screens/home/widgets/results_list.dart';
import 'package:yandex_project/presentation/screens/home/widgets/search_bar.dart';
import 'package:yandex_project/presentation/widgets/background_widget.dart';
import 'package:yandex_project/presentation/widgets/blur_widget.dart';
import 'package:yandex_project/application/navigation/navigation_bloc.dart';
import 'package:yandex_project/presentation/widgets/custom_app_bar.dart';
import 'package:yandex_project/presentation/widgets/keyboard_area_widget.dart';

import '../../../constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ShakeDetector shakeDetector;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchBloc>(context).add(const SearchEvent.randomSelectionCocktail());
    shakeDetector = ShakeDetector.waitForStart(
      onPhoneShake: () async {
        if ((await Vibration.hasCustomVibrationsSupport() ?? false) &&
            (await Vibration.hasAmplitudeControl() ?? false)) {
          Vibration.vibrate(pattern: [0, 7], intensities: [255]);
        }
        BlocProvider.of<NavigationBloc>(context).add(NavigationEvent.changeTab(tab: AppTab.random, context: context));
        BlocProvider.of<SearchBloc>(context).add(const SearchEvent.randomCocktail());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        if (state.tab != AppTab.settings) {
          shakeDetector.startListening();
        } else {
          shakeDetector.startListening();
        }
        // Scaffold for snack bars in case of no connection issues
        return Scaffold(
          body: BackgroundWidget(
            child: Stack(
              children: [
                state.tab == AppTab.favorites ? const FavoritesList() : const ResultsList(),
                CustomAppBar(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.tab.fromEnum(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: BlurWidget(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(AppConstants.smallRadius),
                      topLeft: Radius.circular(AppConstants.smallRadius),
                    ),
                    top: false,
                    child: Column(
                      children: const [
                        KeyboardArea(
                          child: SearchBar(),
                        ),
                        CustomBottomBar(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
