import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_database/business_logic/cubit/bottom_nav_page_cubit.dart';
import 'package:movie_database/presentation/screens/catalog_page.dart';
import 'package:movie_database/presentation/screens/directory_page.dart';
import 'package:movie_database/presentation/screens/home_page.dart';
import 'package:movie_database/presentation/screens/profile_page.dart';
import 'package:movie_database/presentation/styles/colors.dart';
import 'package:movie_database/router/app_routers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/enum/bottom_nav_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: $appColors.toThemeData(context),
      home: BlocProvider(
        create: (context) => BottomNavPageCubit(),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Movie City"),
            ),
            bottomNavigationBar: BottomNavigationWidget(),
            body: BlocBuilder<BottomNavPageCubit, BottomNavPageState>(
              builder: (context, state) {
                switch (state.appHomeScreen) {
                  case AppHomeScreen.home:
                    return HomePage();
                  case AppHomeScreen.catalog:
                    return CatalogPage();
                  case AppHomeScreen.directory:
                    return DirectoryPage();
                  case AppHomeScreen.profile:
                    return ProfilePage();
                }
              },
            ),
          ),
        ),
      ),
      onGenerateRoute: AppRouters().onGenerateRoute,
    );
  }
}

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavPageCubit, BottomNavPageState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.selectedPageIndex,
          onTap: (position) {
            BlocProvider.of<BottomNavPageCubit>(context).selectPage(position);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Catalog"),
            BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Library"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        );
      },
    );
  }
}
