import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_project/application/preferences/preferences_bloc.dart';
import 'package:yandex_project/application/search/search_bloc.dart';
import 'package:yandex_project/constants/constants.dart';
import 'package:yandex_project/domain/general/enums.dart';
import 'package:yandex_project/presentation/widgets/background_widget.dart';
import 'package:yandex_project/presentation/widgets/blur_widget.dart';
import 'package:yandex_project/presentation/widgets/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      buildWhen: (previous, current) {
        return previous != current;
      },
      builder: (context, state) {
        return BackgroundWidget(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120, left: 8, right: 8),
                child: BlurWidget(
                  top: false,
                  bottom: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      brightness(context),
                      const Divider(
                        indent: 20,
                        endIndent: 20,
                      ),
                      appMode(context),
                    ],
                  ),
                ),
              ),
              CustomAppBar(
                title: Text(
                  'Settings',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget brightness(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Icon(Icons.brightness_medium),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Theme',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          PopupMenuButton<ThemeMode>(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.smallRadius)),
            initialValue: context.read<PreferencesBloc>().state.themeMode,
            onSelected: (value) {
              BlocProvider.of<PreferencesBloc>(context).add(PreferencesEvent.changeTheme(themeMode: value));
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) {
              return [
                PopupMenuItem<ThemeMode>(
                  value: ThemeMode.dark,
                  child: Row(
                    children: const [
                      Icon(Icons.dark_mode),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Dark mode'),
                    ],
                  ),
                ),
                PopupMenuItem<ThemeMode>(
                  value: ThemeMode.light,
                  child: Row(
                    children: const [
                      Icon(Icons.light_mode),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Light mode'),
                    ],
                  ),
                ),
                PopupMenuItem<ThemeMode>(
                  value: ThemeMode.system,
                  child: Row(
                    children: const [
                      Icon(Icons.smartphone),
                      SizedBox(
                        width: 5,
                      ),
                      Text('System'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }

  Widget appMode(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Icon(Icons.wine_bar),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Alcohol',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          PopupMenuButton<bool>(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConstants.smallRadius)),
            initialValue: context.read<PreferencesBloc>().state.nonAlcoholicMode,
            onSelected: (value) {
              BlocProvider.of<PreferencesBloc>(context).add(PreferencesEvent.changeSearchMode(mode: value));
              final filter = context.read<SearchBloc>().state.filter;
              if (value) {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchEvent.updateFilter(filter: filter.copyWith(drinkType: DrinkType.values)));
              } else {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchEvent.updateFilter(filter: filter.copyWith(drinkType: [DrinkType.nonAlcoholic])));
              }
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) {
              return [
                PopupMenuItem<bool>(
                  value: false,
                  child: Row(
                    children: const [
                      Icon(Icons.local_bar),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Alcohol'),
                    ],
                  ),
                ),
                PopupMenuItem<bool>(
                  value: true,
                  child: Row(
                    children: const [
                      Icon(Icons.no_drinks),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Alcohol free'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
