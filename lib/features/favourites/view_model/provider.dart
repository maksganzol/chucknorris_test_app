import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/models/joke_model.dart';
import '../services/provider.dart';
import 'favourives_view_model.dart';

final favouritesProvider =
    StateNotifierProvider<FavouritesViewModel, AsyncValue<List<JokeModel>>>(
  (ref) => FavouritesViewModel(
    localStorageService: ref.read(localStorageServiceProvider),
  ),
);
