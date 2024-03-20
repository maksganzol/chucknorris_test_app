import 'package:chucknorris_app/features/search/view_model/search_field_provider.dart';
import 'package:chucknorris_app/features/search/view_model/search_provider.dart';
import 'package:chucknorris_app/shared/widgets/joke_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/error_widget.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jokesAsyncValue = ref.watch(searchProvider);
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onChanged: (value) =>
              ref.read(searchFieldProvider.notifier).state = value,
          decoration: const InputDecoration(
            hintText: 'Type to search...',
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
      body: jokesAsyncValue.when(
        error: (error, stack) => Center(child: ErrorMessage(error: error)),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (jokes) => jokes.isEmpty
            ? Center(
                child: ref.watch(searchFieldProvider).isEmpty
                    ? const Text('Nothing to search')
                    : const Text('No jokes found'),
              )
            : ListView.separated(
                itemBuilder: (context, index) => JokeTile(joke: jokes[index]),
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(height: 1),
                ),
                itemCount: jokes.length,
              ),
      ),
    );
  }
}
