import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eating/meals/bloc/meal_bloc.dart';
import 'package:flutter_eating/posts/model/post_load_data_state_model.dart';
import 'package:flutter_eating/posts/model/post_model.dart';
import 'package:flutter_eating/posts/service/post_api_service.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  int _start = 0;
  final int _limit = 20;
  List<PostModel> posts = [];
  bool stopLoadPost = false;

  PostBloc() : super(PostInitial()) {
    on<PostEvent>((event, emit) {});
    on<LoadPostsEvent>(_fetchPosts);
    on<RefreshPostsEvent>(_refresh);
  }

  void _fetchPosts(LoadPostsEvent event, Emitter<PostState> emit) async {
    emit(const PostFetchDataState(PostLoadDataStateModel.loading));
    final client =
        PostClient(Dio(BaseOptions(contentType: "application/json")));
    try {
      List<PostModel> result = await client.getPosts(_start, _limit);
      if (result.isEmpty) {
        stopLoadPost = true;
      }

      for (PostModel element in result) {
        posts.add(element);
      }

      _start += _limit;
      emit(const PostFetchDataState(PostLoadDataStateModel.success));
    } catch (_) {
      emit(const PostFetchDataState(PostLoadDataStateModel.error));
    }
  }

  void _refresh(RefreshPostsEvent event, Emitter<PostState> emit) async {
    _start = 0;
    posts = [];
    stopLoadPost = false;
    emit(const PostFetchDataState(PostLoadDataStateModel.loading));
    final client =
        PostClient(Dio(BaseOptions(contentType: "application/json")));
    try {
      List<PostModel> result = await client.getPosts(_start, _limit);
      if (result.isEmpty) {
        stopLoadPost = true;
      }

      for (PostModel element in result) {
        posts.add(element);
      }

      _start += _limit;
      emit(const PostFetchDataState(PostLoadDataStateModel.success));
    } catch (_) {
      emit(const PostFetchDataState(PostLoadDataStateModel.error));
    }
  }
}
