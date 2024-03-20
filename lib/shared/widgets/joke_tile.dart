import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/favourites/view_model/provider.dart';
import '../models/joke_model.dart';

class JokeTile extends ConsumerWidget {
  const JokeTile({
    super.key,
    required this.joke,
  });
  final JokeModel joke;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      subtitle: Text(joke.value),
      trailing: _AddToFavouritesButton(joke: joke),
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
          ? const Icon(Icons.bookmark)
          : const Icon(Icons.bookmark_outline),
    );
  }
}
