import 'package:chucknorris_app/shared/models/joke_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/api/chucknorris_api/chucknorris_api.dart';

final randomJokeProvider = FutureProvider.family<JokeModel, String>(
  (ref, category) =>
      ref.read(chuckNorrisApiProvider).getJokeForCategory(category),
);
