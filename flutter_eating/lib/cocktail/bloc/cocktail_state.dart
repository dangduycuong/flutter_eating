part of 'cocktail_bloc.dart';

abstract class CocktailState extends Equatable {
  const CocktailState();
}

class CocktailInitial extends CocktailState {
  @override
  List<Object> get props => [];
}

class LoadingCocktailState extends CocktailState {
  @override
  List<Object?> get props => [];
}

class SearchCocktailSuccessState extends CocktailState {
  @override
  List<Object?> get props => [];
}
