part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class LoadPostsEvent extends PostEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class RefreshPostsEvent extends PostEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
