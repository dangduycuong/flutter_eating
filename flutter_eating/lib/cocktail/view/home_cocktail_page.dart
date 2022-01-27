import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eating/cocktail/bloc/cocktail_bloc.dart';
import 'package:flutter_eating/cocktail/model/cocktail_model.dart';
import 'package:flutter_eating/widgets/cell_item_view.dart';
import 'package:flutter_eating/widgets/detail_data_page.dart';
import 'package:flutter_eating/widgets/loading_list_page.dart';
import 'package:flutter_eating/widgets/search_bar_item.dart';

class HomeCocktailPage extends StatelessWidget {
  const HomeCocktailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CocktailBloc(),
      child: const HomeCocktailView(),
    );
  }
}

class HomeCocktailView extends StatefulWidget {
  const HomeCocktailView({Key? key}) : super(key: key);

  @override
  _HomeCocktailViewState createState() => _HomeCocktailViewState();
}

class _HomeCocktailViewState extends State<HomeCocktailView> {
  late CocktailBloc bloc;

  @override
  void initState() {
    bloc = context.read();
    bloc.add(const SearchCocktailEvent(''));
    super.initState();
  }

  late final _loadingListPage = const LoadingListPage();

  Widget _buildListCocktailView(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final drink = bloc.cocktails[index];
        return CellItemView(
          leadingText: null,
          url: drink.strDrinkThumb,
          title: drink.strDrink,
          subtitle: drink.strInstructions,
          tapToItem: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailDataPage(
                url: drink.strDrinkThumb,
                title: drink.strDrink,
                subtitle: drink.strInstructions,
              );
            }));
          },
        );
      },
      itemCount: bloc.cocktails.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CocktailBloc, CocktailState>(
      builder: (context, state) {
        Widget widget = Expanded(
          child: _loadingListPage,
        );
        if (state is SearchCocktailSuccessState) {
          widget = Expanded(child: _buildListCocktailView(context));
        }
        return Column(
          children: [
            SearchBarItem(textChangValue: (text) {
              bloc.add(SearchCocktailEvent(text));
            }),
            widget,
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}
