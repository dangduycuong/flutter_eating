import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eating/cocktail/bloc/cocktail_bloc.dart';
import 'package:flutter_eating/widgets/loading_list_page.dart';

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
    super.initState();
  }

  late final _loadingListPage = const LoadingListPage();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CocktailBloc, CocktailState>(
      builder: (context, state) {
        return _loadingListPage;
      },
      listener: (context, state) {},
    );
  }
}
