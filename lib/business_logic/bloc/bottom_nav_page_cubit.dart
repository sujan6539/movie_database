import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_database/router/app_routers.dart';

import '../enum/bottom_nav_state.dart';

part 'bottom_nav_page_state.dart';

class BottomNavPageCubit extends Cubit<BottomNavPageState> {
  BottomNavPageCubit() : super(BottomNavPageInitial());

  /// Default page is set to home.
  void selectPage(int position) {
    switch (position) {
      case 1:
        emit(BottomNavPageSelectedState(
          appHomeScreen: AppHomeScreen.catalog,
          selectedPageIndex: position,
          screenPath: AppScreenPath.catalogPath,
        ));
        break;
      case 2:
        emit(BottomNavPageSelectedState(
          appHomeScreen: AppHomeScreen.directory,
          selectedPageIndex: position,
          screenPath: AppScreenPath.directoryPath,
        ));
        break;
      case 3:
        emit(BottomNavPageSelectedState(
          appHomeScreen: AppHomeScreen.profile,
          selectedPageIndex: position,
          screenPath: AppScreenPath.profilePath,
        ));
        break;
      default:
        emit(BottomNavPageSelectedState(
          appHomeScreen: AppHomeScreen.home,
          selectedPageIndex: position,
          screenPath: AppScreenPath.homePath,
        ));
        break;
    }
  }
}
