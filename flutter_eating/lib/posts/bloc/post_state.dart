part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostInitial extends PostState {
  @override
  List<Object> get props => [];
}

class PostFetchDataState extends PostState {
  final PostLoadDataStateModel status;

  const PostFetchDataState(this.status);

  @override
  List<Object?> get props => [status];
}
