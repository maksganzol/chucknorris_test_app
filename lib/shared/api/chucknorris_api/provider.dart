import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dio/provider.dart';
import 'client.dart';

final chuckNorrisApiProvider = Provider(
  (ref) => ChuckNorrisApi(
    ref.read(dioProvider),
  ),
);
