// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$MovieApiService extends MovieApiService {
  _$MovieApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MovieApiService;

  @override
  Future<Response<dynamic>> getMovies({required String key}) {
    final Uri $url =
        Uri.parse('https://api.themoviedb.org/3/trending/all/week');
    final Map<String, dynamic> $params = <String, dynamic>{'api_key': key};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
