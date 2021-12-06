import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences_event.dart';

part 'preferences_bloc.freezed.dart';

part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  PreferencesBloc() : super(PreferencesState.initial());

  @override
  Stream<PreferencesState> mapEventToState(
    PreferencesEvent event,
  ) async* {
    yield* event.map(
      changeTheme: (e) async* {
        yield state.copyWith(
          darkMode: !state.darkMode,
        );
      },
    );
  }
}
