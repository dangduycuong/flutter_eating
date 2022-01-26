import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eating/meals/bloc/meal_bloc.dart';
import 'package:flutter_eating/meals/views/meal_category_detail.dart';
import 'package:flutter_eating/widgets/loading_list_page.dart';

import 'models/meal_categories_model.dart';

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

  Widget _categoryItemImage(String? url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        width: 48,
        height: 48,
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageUrl: url ?? '',
      ),
    );
  }

  Widget _buildCellForRowAt(CategoriesItemModel item) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MealCategoryPage.routeName,
            arguments: item);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            const SizedBox(width: 8),
            _categoryItemImage(item.strCategoryThumb),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${item.strCategory}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${item.strCategoryDescription}',
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
        if (state is MealLoadingData) {
          return const LoadingListPage();
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            return _buildCellForRowAt(bloc.categories[index]);
          },
          itemCount: bloc.categories.length,
        );
      },
      listener: (context, state) {},
    );
  }
}
