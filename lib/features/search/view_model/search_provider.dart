import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/api/chucknorris_api/provider.dart';
import '../../../shared/models/joke_model.dart';
import 'search_field_provider.dart';

final searchProvider = FutureProvider<List<JokeModel>>(
  (ref) async {
    final query = ref.watch(searchFieldProvider);
    if (query.length < 3) return [];
    final response = await ref.read(chuckNorrisApiProvider).searchJokes(query);
    return response.result;
  },
);
