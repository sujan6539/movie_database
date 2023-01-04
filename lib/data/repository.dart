import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:movie_database/data/ApiConstant.dart';
import 'package:movie_database/data/model/TrendingResponse.dart';
import 'package:movie_database/data/movie_api_service.dart';
import 'package:movie_database/properties.dart';

class Repository {
  static Future<TrendingResponse?> getTrendingMovies() async {
    final moviesService = MovieApiService.create();

    /// Making a request is as easy as calling a function of the service.
    final Response<dynamic> response = await moviesService.getMovies(key: movieApiKey);

    if (response.isSuccessful) {
      // Successful request
      final body = response.body;
      var result = TrendingResponse.fromJson(body);
      return result;
    } else {
      // Error code received from server
      final code = response.statusCode;
      final error = response.error;
      return null;
    }
  }
}
