import 'package:chucknorris_app/router/router.dart';
import 'package:chucknorris_app/shared/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../view_model/categories_list_view_model.dart';

class CategoriesListScreen extends ConsumerWidget {
  const CategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsyncData = ref.watch(categoriesListViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: categoriesAsyncData.when(
          data: (categories) => ListView.separated(
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(height: 1),
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];

              return ListTile(
                onTap: () {
                  context.go('${AppRoutes.categoriesList}/$category');
                },
                title: Text(category),
                trailing: const Icon(Icons.read_more_outlined),
              );
            },
          ),
          error: (error, stack) => Center(child: ErrorMessage(error: error)),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
