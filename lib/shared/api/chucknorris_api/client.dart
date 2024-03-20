import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/joke_model.dart';
import '../../models/search_results_model.dart';

part 'client.g.dart';

@RestApi()
abstract class ChuckNorrisApi {
  factory ChuckNorrisApi(Dio dio) = _ChuckNorrisApi;

  @GET('/jokes/categories')
  Future<List<String>> getCategories();

  @GET('/jokes/random')
  Future<JokeModel> getJokeForCategory(@Query('category') String category);

  @GET('/jokes/search')
  Future<SearchResults> searchJokes(@Query('query') String query);
}
