import 'package:chopper/chopper.dart';
import 'package:movie_database/data/model/TrendingResponse.dart';

import 'ApiConstant.dart';

part 'movie_api_service.chopper.dart';

@ChopperApi(baseUrl: ApiConstant.baseURL)
abstract class MovieApiService extends ChopperService {
  @Get(path: ApiConstant.trendingAllWeek)
  Future<Response<dynamic>> getMovies({@Query('api_key') required String key});

  static MovieApiService create() {
    final chopperClient = ChopperClient(
      services: [
        // Create and pass an instance of the generated service to the client
        _$MovieApiService()
      ],
      converter: JsonConverter()
    );
    return _$MovieApiService(chopperClient);
  }
}
