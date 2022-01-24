part of 'meal_bloc.dart';

abstract class MealState extends Equatable {
  const MealState();
}

class MealInitial extends MealState {
  @override
  List<Object> get props => [];
}

class MealLoadingData extends MealState {
  @override
  List<Object> get props => [];
}

class MealLoadDataSuccess extends MealState {
  @override
  List<Object> get props => [];
}
