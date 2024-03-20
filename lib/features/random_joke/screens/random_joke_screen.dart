import 'package:chucknorris_app/features/favourites/view_model/provider.dart';
import 'package:chucknorris_app/features/random_joke/view_model/random_joke_provider.dart';
import 'package:chucknorris_app/shared/models/joke_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/error_widget.dart';

class RandomJokeScreen extends ConsumerWidget {
  const RandomJokeScreen(this.category, {super.key});

  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jokeAsyncData = ref.watch(randomJokeProvider(category));

    return Scaffold(
      appBar: AppBar(
        title: Text('Random joke about $category'),
      ),
      floatingActionButton: jokeAsyncData.whenOrNull(
        data: (joke) => _AddToFavouritesButton(joke: joke),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: jokeAsyncData.when(
            data: (joke) => Text(
              joke.value,
              textAlign: TextAlign.center,
            ),
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Center(child: ErrorMessage(error: error)),
          ),
        ),
      ),
    );
  }
}

class _AddToFavouritesButton extends ConsumerWidget {
  const _AddToFavouritesButton({
    required this.joke,
  });

  final JokeModel joke;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavourite = ref.watch(
      favouritesProvider.select(
        (jokes) => jokes.asData?.value.contains(joke) ?? false,
      ),
    );
    return IconButton(
      onPressed: () {
        final provider = ref.read(favouritesProvider.notifier);
        if (isFavourite) {
          provider.removeJoke(joke);
        } else {
          provider.saveJoke(joke);
        }
      },
      icon: isFavourite
          ? const Icon(Icons.bookmark_added, size: 32)
          : const Icon(Icons.bookmark_add_outlined, size: 32),
    );
  }
}
