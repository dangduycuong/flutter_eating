import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cocktail_event.dart';
part 'cocktail_state.dart';

class CocktailBloc extends Bloc<CocktailEvent, CocktailState> {
  CocktailBloc() : super(CocktailInitial()) {
    on<CocktailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
