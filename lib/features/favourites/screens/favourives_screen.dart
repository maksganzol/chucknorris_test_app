import 'package:chucknorris_app/features/favourites/view_model/provider.dart';
import 'package:chucknorris_app/shared/widgets/joke_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/error_widget.dart';

class FavouritesScreen extends ConsumerWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jokesAsyncValue = ref.watch(favouritesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: jokesAsyncValue.when(
        data: (jokes) => jokes.isEmpty
            ? const Center(
                child: Text('You have saved added any jokes yet'),
              )
            : ListView.separated(
                itemCount: jokes.length,
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(height: 1),
                ),
                itemBuilder: (context, index) => JokeTile(
                  joke: jokes[index],
                ),
              ),
        error: (error, stack) => Center(child: ErrorMessage(error: error)),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
