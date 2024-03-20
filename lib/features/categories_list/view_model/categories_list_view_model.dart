import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/api/chucknorris_api/provider.dart';

final categoriesListViewModelProvider = FutureProvider<List<String>>(
  (ref) => ref.read(chuckNorrisApiProvider).getCategories(),
);
