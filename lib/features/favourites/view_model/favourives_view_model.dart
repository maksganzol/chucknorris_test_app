import 'dart:convert';

import 'package:chucknorris_app/features/favourites/services/local_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/models/joke_model.dart';

class FavouritesViewModel extends StateNotifier<AsyncValue<List<JokeModel>>> {
  FavouritesViewModel({required LocalStorageService localStorageService})
      : _localStorageService = localStorageService,
        super(const AsyncValue.loading()) {
    laodJokes();
  }

  final LocalStorageService _localStorageService;
  static const String _favouritesKey = 'favourites';

  bool isFavourive(JokeModel joke) {
    final jokes = state.asData?.value ?? [];
    return jokes.contains(joke);
  }

  void laodJokes() async {
    state = const AsyncValue.loading();

    final jokesString = await _localStorageService.getString(_favouritesKey);
    if (jokesString == null) {
      state = const AsyncValue.data([]);
      return;
    }

    final jokesJson = List<Map<String, dynamic>>.from(jsonDecode(jokesString));
    final jokes = jokesJson.map(JokeModel.fromJson).toList();

    state = AsyncValue<List<JokeModel>>.data(jokes);
  }

  void saveJoke(JokeModel joke) async {
    final updatedJokes = <JokeModel>[...state.asData?.value ?? [], joke];

    state = AsyncValue<List<JokeModel>>.data(updatedJokes);
    await _localStorageService.setString(
      _favouritesKey,
      json.encode(updatedJokes.map((joke) => joke.toJson()).toList()),
    );
  }

  void removeJoke(JokeModel joke) async {
    final updatedJokes = <JokeModel>[...state.asData?.value ?? []]
      ..remove(joke);

    state = AsyncValue<List<JokeModel>>.data(updatedJokes);

    await _localStorageService.setString(
      _favouritesKey,
      json.encode(updatedJokes.map((joke) => joke.toJson()).toList()),
    );
  }
}
