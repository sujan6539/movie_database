part of 'fetch_movies_cubit.dart';

@immutable
abstract class FetchMoviesState {}

class FetchMoviesInitial extends FetchMoviesState {}

class FetchMoviesComplete extends FetchMoviesState {
  TrendingResponse? trendingResponse;

  FetchMoviesComplete({this.trendingResponse});
}
