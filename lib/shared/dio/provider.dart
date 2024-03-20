import 'package:riverpod/riverpod.dart';

import 'setup_dio_client.dart';

final dioProvider = Provider((ref) => setupDioClient());
