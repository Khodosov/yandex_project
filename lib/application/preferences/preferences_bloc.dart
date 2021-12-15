import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:yandex_project/application/services/application_db.dart';
import 'package:yandex_project/domain/models/preferences_db/preferences_db.dart';

part 'preferences_event.dart';

part 'preferences_bloc.freezed.dart';

part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  PreferencesBloc() : super(PreferencesState.initial());

  @override
  Stream<PreferencesState> mapEventToState(
    PreferencesEvent event,
  ) async* {
    final dataBase = AppDBService();

    yield* event.map(
      ///
      /// Init
      ///
      init: (e) async* {
        final settings = await dataBase.getSettings();
        yield settings;
      },
      changeSearchMode: (e) async* {
        dataBase.putSettings(
          state.copyWith(
            nonAlcoholicMode: e.mode,
          ),
        );
        yield state.copyWith(
          nonAlcoholicMode: e.mode,
        );
      },
      changeTheme: (e) async* {
        dataBase.putSettings(
          state.copyWith(
            themeMode: e.themeMode,
          ),
        );
        yield state.copyWith(
          themeMode: e.themeMode,
        );
      },
    );
  }
}
