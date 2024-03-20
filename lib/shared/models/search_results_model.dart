import 'package:freezed_annotation/freezed_annotation.dart';

import 'joke_model.dart';

part 'search_results_model.freezed.dart';
part 'search_results_model.g.dart';

@freezed
class SearchResults with _$SearchResults {
  const factory SearchResults({
    required List<JokeModel> result,
  }) = _SearchResults;

  factory SearchResults.fromJson(Map<String, dynamic> json) =>
      _$SearchResultsFromJson(json);
}
