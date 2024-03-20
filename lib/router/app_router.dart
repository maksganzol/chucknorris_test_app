import 'package:chucknorris_app/features/favourites/screens/favourives_screen.dart';
import 'package:chucknorris_app/features/search/screens/search_screen.dart';
import 'package:go_router/go_router.dart';

import '../features/features.dart';
import 'app_routes.dart';
import 'route_keys.dart';

final appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state, child) => BottomNavigationContainer(
        child: child,
      ),
      branches: [
        StatefulShellBranch(
          navigatorKey: categoriesListKey,
          routes: [
            GoRoute(
              path: AppRoutes.categoriesList,
              builder: (context, state) => const CategoriesListScreen(),
              routes: [
                GoRoute(
                  path: ':category',
                  builder: (context, state) => RandomJokeScreen(
                    state.pathParameters['category'] ?? '',
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: favouritesKey,
          routes: [
            GoRoute(
              path: AppRoutes.favourites,
              builder: (context, state) => const FavouritesScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: searchKey,
          routes: [
            GoRoute(
              path: AppRoutes.search,
              builder: (context, state) => const SearchScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
