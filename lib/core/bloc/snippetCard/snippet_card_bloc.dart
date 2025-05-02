import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'snippet_card_event.dart';
part 'snippet_card_state.dart';

class SnippetCardBloc extends Bloc<SnippetCardEvent, SnippetCardState> {
  SnippetCardBloc() : super(SnippetCardInitial()) {
    on<SnippetCardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
