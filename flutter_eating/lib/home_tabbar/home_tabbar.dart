import 'package:flutter/material.dart';
import 'package:flutter_eating/cocktail/view/home_cocktail_page.dart';
import 'package:flutter_eating/meals/views/category_meal_page.dart';
import 'package:flutter_eating/meals/views/search_meals_name.dart';
import 'package:flutter_eating/posts/views/post_page.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({Key? key}) : super(key: key);

  @override
  _HomeBottomBarState createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int _selectedIndex = 0;

  String get titleAppBar {
    String result = '';
    switch (_selectedIndex) {
      case 0:
        result = 'Category Meals';
        break;
      case 1:
        result = 'Search Meals';
        break;
      case 2:
        result = 'Posts';
        break;
      default:
        result = 'Cocktails';
        break;
    }
    return result;
  }

  static const List<Widget> _widgetOptions = <Widget>[
    CategoryMealPage(),
    SearchMealsNamePage(),
    PostsListPage(),
    HomeCocktailPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleAppBar,
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Meal Categories',
            backgroundColor: Colors.deepOrange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Meals',
            backgroundColor: Colors.deepOrange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: 'Posts',
            backgroundColor: Colors.deepOrange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hourglass_full_rounded),
            label: 'Cocktail',
            backgroundColor: Colors.deepOrange,
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        selectedItemColor: Colors.yellowAccent.withOpacity(1),
        onTap: _onItemTapped,
      ),
    );
  }
}
