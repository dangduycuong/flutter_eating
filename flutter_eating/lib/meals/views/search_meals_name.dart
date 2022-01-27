import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eating/meals/bloc/meal_bloc.dart';
import 'package:flutter_eating/widgets/cell_item_view.dart';
import 'package:flutter_eating/widgets/detail_data_page.dart';
import 'package:flutter_eating/widgets/loading_list_page.dart';
import 'package:flutter_eating/widgets/search_bar_item.dart';

class SearchMealsNamePage extends StatelessWidget {
  const SearchMealsNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealBloc(),
      child: const SearchMealsNameView(),
    );
  }
}

class SearchMealsNameView extends StatefulWidget {
  const SearchMealsNameView({Key? key}) : super(key: key);

  @override
  _SearchMealsNameViewState createState() => _SearchMealsNameViewState();
}

class _SearchMealsNameViewState extends State<SearchMealsNameView> {
  late MealBloc _bloc;

  @override
  void initState() {
    _bloc = context.read();
    _bloc.add(const SearchMealsByName(''));
    super.initState();
  }

  late LoadingListPage loadingListPage = const LoadingListPage();

  Widget _buildListMeal() {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = _bloc.meals[index];
        return CellItemView(
          leadingText: null,
          url: item.strMealThumb,
          title: item.strMeal,
          subtitle: item.strInstructions,
          tapToItem: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailDataPage(
                url: item.strMealThumb,
                title: item.strMeal,
                subtitle: item.strInstructions,
              );
            }));
          },
        );
      },
      itemCount: _bloc.meals.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealBloc, MealState>(
      builder: (context, state) {
        Widget widget;
        switch (state.runtimeType) {
          case SearchMealErrorState:
            widget = Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '$state.error',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
            );
            break;
          case MealLoadingData:
            widget = loadingListPage;
            break;
          default:
            widget = _buildListMeal();
            break;
        }
        return Column(
          children: [
            SearchBarItem(
              textChangValue: (value) => _bloc.add(SearchMealsByName(value)),
            ),
            Expanded(child: widget),
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}
