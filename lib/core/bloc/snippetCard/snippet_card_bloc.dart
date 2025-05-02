import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'snippet_card_state.dart';
part 'snippet_card_event.dart';
class SnippetBloc extends Bloc<SnippetEvent, SnippetState> {
  SnippetBloc() : super(const SnippetState()) {
    on<ToggleSnippet>((event, emit) {
      final newMap = Map<String, bool>.from(state.expandedMap);
      newMap[event.snippetId] = !(newMap[event.snippetId] ?? false);
      emit(state.copyWith(expandedMap: newMap));
    });
  }
}