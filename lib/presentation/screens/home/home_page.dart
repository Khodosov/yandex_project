import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shake/shake.dart';
import 'package:vibration/vibration.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/domain/general/enums.dart';
import 'package:yandex_project/main.dart';
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

class _HomePageState extends State<HomePage> with WidgetsBindingObserver, RouteAware {
  bool isResumed = true;
  bool isCurrent = true;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    isResumed = state == AppLifecycleState.resumed;
  }

  late final ShakeDetector shakeDetector;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    App.routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    BlocProvider.of<SearchBloc>(context).add(const SearchEvent.randomSelectionCocktail());
    shakeDetector = ShakeDetector.waitForStart(
      onPhoneShake: () async {
        final connected = context.read<SearchBloc>().state.isConnected;

        if (connected) {
          if (isResumed && isCurrent) {
            if ((await Vibration.hasCustomVibrationsSupport() ?? false) &&
                (await Vibration.hasAmplitudeControl() ?? false)) {
              Vibration.vibrate(pattern: [0, 10, 20, 10], intensities: [255, 255]);
            }
            BlocProvider.of<NavigationBloc>(context)
                .add(NavigationEvent.changeTab(tab: AppTab.random, context: context));
            BlocProvider.of<SearchBloc>(context).add(const SearchEvent.randomCocktail());
          }
        } else {
          AppConstants.badConnection(context);
        }
      },
    )..startListening();
  }

  @override
  void didPopNext() {
    isCurrent = true;
  }

  @override
  void didPushNext() {
    isCurrent = false;
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    App.routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        return BackgroundWidget(
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
                child: BlocBuilder<SearchBloc, SearchState>(
                  buildWhen: (previous, current) {
                    return previous.isConnected != current.isConnected;
                  },
                  builder: (context, state) {
                    return BlurWidget(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(AppConstants.smallRadius),
                        topLeft: Radius.circular(AppConstants.smallRadius),
                      ),
                      top: false,
                      child: Column(
                        children: [
                          KeyboardArea(
                            child: SearchBar(
                              enabled: state.isConnected,
                            ),
                          ),
                          const CustomBottomBar(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
