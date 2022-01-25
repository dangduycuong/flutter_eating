import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eating/meals/bloc/meal_bloc.dart';
import 'package:flutter_eating/widgets/loading_list_page.dart';
import 'package:flutter_eating/widgets/search_bar_item.dart';
import 'package:flutter_eating/meals/models/search_meals_result_model.dart';

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

    super.initState();
  }

  late LoadingListPage loadingListPage = const LoadingListPage();

  Widget _buildListMeal() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return _buildMealItem(_bloc.meals[index]);
      },
      itemCount: _bloc.meals.length,
    );
  }

  Widget _mealImage(String? url) {
    return ClipOval(
      child: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageUrl: url ?? '',
        width: 48,
        height: 48,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildMealItem(MealResultItem meal) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            const SizedBox(width: 8),
            _mealImage(meal.strMealThumb),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${meal.strMeal}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${meal.strInstructions}',
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
                size: 16,
              ),
            )
          ],
        ),
      ),
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
