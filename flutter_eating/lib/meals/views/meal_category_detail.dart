import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eating/meals/models/meal_categories_model.dart';

class MealCategoryPage extends StatefulWidget {
  const MealCategoryPage({Key? key}) : super(key: key);

  static const routeName = 'MealCategoryPage';

  @override
  _MealCategoryPageState createState() => _MealCategoryPageState();
}

class _MealCategoryPageState extends State<MealCategoryPage> {
  Widget _categoryImage(String? imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageUrl: imageUrl ?? '',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CategoriesItemModel item =
        ModalRoute.of(context)!.settings.arguments as CategoriesItemModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${item.strCategory}',
        ),
      ),
      body: Column(
        children: [
          _categoryImage(item.strCategoryThumb),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                '${item.strCategoryDescription}',
                maxLines: null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
