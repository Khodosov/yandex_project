import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_project/domain/general/enums.dart';
import 'package:flutter/material.dart';

part 'navigation_bloc.freezed.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState.initial());

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    yield* event.map(
      changeTab: (e) async* {
        if (e.tab == AppTab.settings) {
          Navigator.pushNamed(e.context, '/settings');
        } else {
          yield state.copyWith(
            tab: e.tab,
          );
        }
      },
    );
  }
}
