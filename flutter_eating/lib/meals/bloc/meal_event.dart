part of 'meal_bloc.dart';

abstract class MealEvent extends Equatable {
  const MealEvent();
}

class LoadMealCategories extends MealEvent {
  @override
  List<Object?> get props => [];
}

class SearchMealsByName extends MealEvent {
  final String text;
  const SearchMealsByName(this.text);
  @override
  List<Object?> get props => [];
}
