import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.error});
  final Object error;
  @override
  Widget build(BuildContext context) {
    final error = this.error;
    if (error is DioException) {
      return Text('Server Error ${error.message}');
    }
    return const Text('Oups, something went wrong...');
  }
}
