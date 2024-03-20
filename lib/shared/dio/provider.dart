import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'setup_dio_client.dart';

final dioProvider = Provider((ref) => setupDioClient());
