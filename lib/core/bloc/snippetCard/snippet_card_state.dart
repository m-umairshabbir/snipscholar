part of 'snippet_card_bloc.dart';
// State
class SnippetState extends Equatable {
  final Map<String, bool> expandedMap;

  const SnippetState({this.expandedMap = const {}});

  SnippetState copyWith({Map<String, bool>? expandedMap}) {
    return SnippetState(expandedMap: expandedMap ?? this.expandedMap);
  }

  @override
  List<Object?> get props => [expandedMap];
}