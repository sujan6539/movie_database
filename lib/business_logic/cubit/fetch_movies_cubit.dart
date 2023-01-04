import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_database/data/repository.dart';

import '../../data/model/TrendingResponse.dart';

part 'fetch_movies_state.dart';

class FetchMoviesCubit extends Cubit<FetchMoviesState> {
  FetchMoviesCubit() : super(FetchMoviesInitial());

  void fetchMovies() {
    Repository.getTrendingMovies()
        .then((value) => {emit(FetchMoviesComplete(trendingResponse: value))});
  }
}
