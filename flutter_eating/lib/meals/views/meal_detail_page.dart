import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eating/meals/bloc/meal_bloc.dart';
import 'package:flutter_eating/meals/models/search_meals_result_model.dart';
import 'package:flutter_eating/widgets/youtube_player_demo_page.dart';
import 'package:google_fonts/google_fonts.dart';

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
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, YoutubePlayerDemoPage.routeName);
                        },
                        child: _mealImage(meal.strMealThumb),
                      ),
                      Text(
                        '${meal.strInstructions}',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.bodyText1,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
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
