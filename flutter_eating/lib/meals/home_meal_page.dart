import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eating/meals/bloc/meal_bloc.dart';
import 'package:flutter_eating/meals/views/meal_category_detail.dart';
import 'package:flutter_eating/widgets/loading_list_page.dart';

class HomeMealPage extends StatelessWidget {
  const HomeMealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MealBloc()..add(LoadMealCategories()),
        child: const HomeMealView());
  }
}

class HomeMealView extends StatefulWidget {
  const HomeMealView({Key? key}) : super(key: key);

  @override
  _HomeMealViewState createState() => _HomeMealViewState();
}

class _HomeMealViewState extends State<HomeMealView> {
  late MealBloc bloc;

  @override
  void initState() {
    bloc = context.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealBloc, MealState>(
      builder: (context, state) {
        if (state is MealLoadingData) {
          return const LoadingListPage();
        }
        return Container(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {Navigator.pushNamed(context, MealCategoryPage.routeName, arguments: bloc.categories[index]);},
                child: Card(
                  color: Colors.white,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        width: 24,
                        height: 24,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        imageUrl: '${bloc.categories[index].strCategoryThumb}',
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${bloc.categories[index].strCategory}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            Text(
                              '${bloc.categories[index].strCategoryDescription}',
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: bloc.categories.length,
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
