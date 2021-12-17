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
      padding: const EdgeInsets.only(top: 8.0, right: 25, bottom: 8),
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
          DropdownButton<ThemeMode>(
            underline: const SizedBox.shrink(),
            selectedItemBuilder: (context) {
              return [
                const SizedBox(
                  width: 100,
                ),
                const SizedBox(
                  width: 100,
                ),
                const SizedBox(
                  width: 100,
                )
              ];
            },
            borderRadius: BorderRadius.circular(AppConstants.smallRadius),
            value: context.read<PreferencesBloc>().state.themeMode,
            onChanged: (value) {
              BlocProvider.of<PreferencesBloc>(context)
                  .add(PreferencesEvent.changeTheme(themeMode: value ?? ThemeMode.system));
            },
            icon: const Icon(Icons.more_vert),
            items: [
              DropdownMenuItem<ThemeMode>(
                value: ThemeMode.dark,
                child: Row(
                  children: [
                    Icon(Icons.dark_mode,
                        color: context.read<PreferencesBloc>().state.themeMode == ThemeMode.dark ? Colors.grey : null),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Dark mode',
                      style: TextStyle(
                          color:
                              context.read<PreferencesBloc>().state.themeMode == ThemeMode.dark ? Colors.grey : null),
                    ),
                  ],
                ),
              ),
              DropdownMenuItem<ThemeMode>(
                value: ThemeMode.light,
                child: Row(
                  children: [
                    Icon(Icons.light_mode,
                        color: context.read<PreferencesBloc>().state.themeMode == ThemeMode.light ? Colors.grey : null),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Light mode',
                      style: TextStyle(
                          color:
                              context.read<PreferencesBloc>().state.themeMode == ThemeMode.light ? Colors.grey : null),
                    ),
                  ],
                ),
              ),
              DropdownMenuItem<ThemeMode>(
                value: ThemeMode.system,
                child: Row(
                  children: [
                    Icon(Icons.smartphone,
                        color:
                            context.read<PreferencesBloc>().state.themeMode == ThemeMode.system ? Colors.grey : null),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'System',
                      style: TextStyle(
                          color:
                              context.read<PreferencesBloc>().state.themeMode == ThemeMode.system ? Colors.grey : null),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget appMode(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 25, bottom: 8),
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
          DropdownButton<bool>(
            underline: const SizedBox.shrink(),
            selectedItemBuilder: (context) {
              return [
                const SizedBox(
                  width: 100,
                ),
                const SizedBox(
                  width: 100,
                ),
              ];
            },
            borderRadius: BorderRadius.circular(AppConstants.smallRadius),
            value: context.read<PreferencesBloc>().state.nonAlcoholicMode,
            onChanged: (value) {
              BlocProvider.of<PreferencesBloc>(context).add(PreferencesEvent.changeSearchMode(mode: value ?? false));
              final filter = context.read<SearchBloc>().state.filter;
              if (value ?? false) {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchEvent.updateFilter(filter: filter.copyWith(drinkType: DrinkType.values)));
              } else {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchEvent.updateFilter(filter: filter.copyWith(drinkType: [DrinkType.nonAlcoholic])));
              }
            },
            icon: const Icon(Icons.more_vert),
            items: [
              DropdownMenuItem<bool>(
                value: false,
                child: Row(
                  children: [
                    Icon(
                      Icons.local_bar,
                      color: !context.read<PreferencesBloc>().state.nonAlcoholicMode ? Colors.grey : null,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Alcohol',
                      style: TextStyle(
                        color: !context.read<PreferencesBloc>().state.nonAlcoholicMode ? Colors.grey : null,
                      ),
                    ),
                  ],
                ),
              ),
              DropdownMenuItem<bool>(
                value: true,
                child: Row(
                  children: [
                    Icon(
                      Icons.no_drinks,
                      color: context.read<PreferencesBloc>().state.nonAlcoholicMode ? Colors.grey : null,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Alcohol free',
                      style: TextStyle(
                        color: context.read<PreferencesBloc>().state.nonAlcoholicMode ? Colors.grey : null,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomPopupMenuItem<T> extends PopupMenuItem<T> {
  const CustomPopupMenuItem({Key? key, required Widget child, required T value})
      : super(key: key, child: child, value: value);

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() => CustomPopupMenuItemState<T, PopupMenuItem<T>>();
}

class CustomPopupMenuItemState<T, W extends PopupMenuItem<T>> extends PopupMenuItemState<T, W> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(AppConstants.smallRadius),
      clipBehavior: Clip.antiAlias,
      child: super.build(context),
    );
  }
}
