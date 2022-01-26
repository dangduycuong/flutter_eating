import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eating/meals/bloc/meal_bloc.dart';
import 'package:flutter_eating/meals/models/search_meals_result_model.dart';
import 'package:flutter_eating/widgets/youtube_player_demo_page.dart';

class MealDetailPage extends StatefulWidget {
  const MealDetailPage({Key? key}) : super(key: key);

  static const routeName = 'MealDetailPage';

  @override
  _MealDetailPageState createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  Widget _mealImage(String? url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageUrl: url ?? '',
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MealResultItem meal =
        ModalRoute.of(context)?.settings.arguments as MealResultItem;
    return BlocProvider(
      create: (_) => MealBloc(),
      child: BlocConsumer<MealBloc, MealState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('${meal.strMeal}'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, YoutubePlayerDemoPage.routeName);
                      },
                      child: _mealImage(meal.strMealThumb),
                    ),
                    Text('${meal.strInstructions}'),
                    Text('${meal.strInstructions}'),
                    Text('${meal.strInstructions}'),
                    Text('${meal.strInstructions}'),
                    Text('${meal.strInstructions}'),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
