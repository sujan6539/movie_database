import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_database/data/ApiConstant.dart';
import 'package:movie_database/business_logic/cubit/fetch_movies_cubit.dart';
import 'package:movie_database/data/model/TrendingResponse.dart';
import 'package:movie_database/data/repository.dart';
import 'package:movie_database/presentation/model/hero_card_data.dart';
import 'package:movie_database/presentation/ui/common/cards/hero_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (context) => FetchMoviesCubit(),
        child: TrendingSwimLane(),
      ),
    );
  }
}

class TrendingSwimLane extends StatelessWidget {
  const TrendingSwimLane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FetchMoviesCubit>(context).fetchMovies();
    return BlocBuilder<FetchMoviesCubit, FetchMoviesState>(
      builder: (context, state) {
        TrendingResponse? response = null;
        if (state is FetchMoviesComplete) {
          response = (state as FetchMoviesComplete).trendingResponse;
        }
        return ListView.builder(
          shrinkWrap: true,

          scrollDirection: Axis.horizontal,
          itemCount: response?.results?.length,
          itemBuilder: (BuildContext context, int index) {
            return HeroCard(
                heroCardModel: HeroCardModel(
                    imageUrl:
                        "${ApiConstant.imageBaseURL}${response?.results![index].backdropPath}",
                    header: response?.results![index].title ?? '',
                    title: response?.results![index].releaseDate ?? ''));
          },
        );
      },
    );
  }
}
