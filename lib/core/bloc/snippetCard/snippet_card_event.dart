part of 'snippet_card_bloc.dart';
// Events
abstract class SnippetEvent extends Equatable {
  const SnippetEvent();
  @override
  List<Object?> get props => [];
}

class ToggleSnippet extends SnippetEvent {
  final String snippetId;

  const ToggleSnippet(this.snippetId);

  @override
  List<Object?> get props => [snippetId];
}