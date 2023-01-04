import 'package:flutter/material.dart';
import 'package:movie_database/presentation/screens/catalog_page.dart';
import 'package:movie_database/presentation/screens/detail_page.dart';
import 'package:movie_database/presentation/screens/directory_page.dart';
import 'package:movie_database/presentation/screens/home_page.dart';
import 'package:movie_database/presentation/screens/profile_page.dart';

class AppScreenPath {
  static const String homePath = '/';
  static const String catalogPath = '/catalog';
  static const String directoryPath = '/directory';
  static const String profilePath = '/profile';
  static const String detailPath = '/detail';
}

class AppRouters {

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppScreenPath.homePath:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppScreenPath.catalogPath:
        return MaterialPageRoute(builder: (_) => const CatalogPage());
      case AppScreenPath.directoryPath:
        return MaterialPageRoute(builder: (_) => const DirectoryPage());
      case AppScreenPath.profilePath:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case AppScreenPath.detailPath:
        return MaterialPageRoute(builder: (_) => const DetailPage());
      default:
        return null;
    }
  }
}
