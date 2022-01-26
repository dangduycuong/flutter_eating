import 'package:flutter/material.dart';
import 'package:flutter_eating/home_tabbar/home_tabbar.dart';
import 'package:flutter_eating/widgets/youtube_player_demo_page.dart';

import 'meals/views/meal_category_detail.dart';
import 'meals/views/meal_detail_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        MealCategoryPage.routeName: (context) => const MealCategoryPage(),
        MealDetailPage.routeName: (context) => const MealDetailPage(),
        YoutubePlayerDemoPage.routeName: (context) => const YoutubePlayerDemoPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeBottomBar(),
    );
  }
}
