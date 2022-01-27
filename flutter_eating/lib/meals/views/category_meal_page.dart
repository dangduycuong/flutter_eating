import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eating/meals/bloc/meal_bloc.dart';
import 'package:flutter_eating/widgets/cell_item_view.dart';
import 'package:flutter_eating/widgets/detail_data_page.dart';
import 'package:flutter_eating/widgets/loading_list_page.dart';

class CategoryMealPage extends StatelessWidget {
  const CategoryMealPage({Key? key}) : super(key: key);

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
        return ListView.builder(
          itemBuilder: (context, index) {
            final item = bloc.categories[index];
            return CellItemView(
              leadingText: null,
              url: item.strCategoryThumb,
              title: item.strCategory,
              subtitle: item.strCategoryDescription,
              tapToItem: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailDataPage(
                    url: item.strCategoryThumb,
                    title: item.strCategory,
                    subtitle: item.strCategoryDescription,
                  );
                }));
              },
            );
          },
          itemCount: bloc.categories.length,
        );
      },
      listener: (context, state) {},
    );
  }
}
