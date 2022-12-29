part of 'bottom_nav_page_cubit.dart';

abstract class BottomNavPageState {
  abstract AppHomeScreen appHomeScreen;
  abstract int selectedPageIndex;
  abstract String screenPath;
}

class BottomNavPageInitial extends BottomNavPageState {
  @override
  AppHomeScreen appHomeScreen = AppHomeScreen.home;

  @override
  int selectedPageIndex = 0;

  @override
  String screenPath = AppScreenPath.homePath;
}

class BottomNavPageSelectedState extends BottomNavPageState {
  @override
  AppHomeScreen appHomeScreen;

  @override
  int selectedPageIndex;

  @override
  String screenPath;

  BottomNavPageSelectedState(
      {required this.appHomeScreen,
      required this.selectedPageIndex,
      required this.screenPath});
}
