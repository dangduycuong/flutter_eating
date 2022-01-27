part of 'cocktail_bloc.dart';

abstract class CocktailEvent extends Equatable {
  const CocktailEvent();
}

class SearchCocktailEvent extends CocktailEvent {
  final String text;

  const SearchCocktailEvent(this.text);

  @override
  List<Object?> get props => [text];
}
