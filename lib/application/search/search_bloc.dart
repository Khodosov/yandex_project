import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yandex_project/application/application_apis.dart';

part 'search_event.dart';

part 'search_bloc.freezed.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState.initial());

  @override
  Stream<SearchState> mapEventToState(
      SearchEvent event,
      ) async* {
    yield* event.map(
      searchByName: (e) async* {
        AppApisService().cocktailByName(e.name);

        yield state.copyWith();
      },
    );
  }
}
