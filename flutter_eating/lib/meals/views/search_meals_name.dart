import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eating/meals/bloc/meal_bloc.dart';
import 'package:flutter_eating/widgets/loading_list_page.dart';

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
  final _textController = TextEditingController();
  late MealBloc _bloc;

  void _onClearTapped() {
    _textController.text = '';
    // _githubSearchBloc.add(const TextChanged(text: ''));
  }

  @override
  void initState() {
    _bloc = context.read();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealBloc, MealState>(
      builder: (context, state) {
        if (state is MealLoadingData) {
          return const LoadingListPage();
        }
        return Column(
          children: [
            TextField(
              controller: _textController,
              autocorrect: false,
              onChanged: (text) {
                _bloc.add(SearchMealsByName(text));
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: GestureDetector(
                  onTap: _onClearTapped,
                  child: const Icon(Icons.clear),
                ),
                border: InputBorder.none,
                hintText: 'Enter a search term',
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            imageUrl: '${_bloc.meals[index].strMealThumb}',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              children: [
                                Text('${_bloc.meals[index].strMeal}'),
                                Text(
                                  '${_bloc.meals[index].strInstructions}',
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: _bloc.meals.length,
              ),
            ),
            Text('${_bloc.meals.length}'),
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}
