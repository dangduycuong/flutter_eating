import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eating/posts/bloc/post_bloc.dart';
import 'package:flutter_eating/widgets/cell_item_view.dart';
import 'package:flutter_eating/widgets/detail_data_page.dart';
import 'package:loadmore/loadmore.dart';

class PostsListPage extends StatelessWidget {
  const PostsListPage({Key? key}) : super(key: key);

  static const routeName = 'PostsListPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostBloc(),
      child: const PostsListView(),
    );
  }
}

class PostsListView extends StatefulWidget {
  const PostsListView({Key? key}) : super(key: key);

  @override
  _PostsListViewState createState() => _PostsListViewState();
}

class _PostsListViewState extends State<PostsListView> {
  late PostBloc bloc;

  @override
  void initState() {
    bloc = context.read();
    bloc.add(LoadPostsEvent());
    super.initState();
  }

  Future<bool> _loadMore() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 2000));
    bloc.add(LoadPostsEvent());
    return true;
  }

  Future<void> _refresh() async {
    bloc.add(RefreshPostsEvent());
  }

  Widget _buildRefreshIndicator(BuildContext context) {
    return RefreshIndicator(
      child: LoadMore(
        isFinish: bloc.stopLoadPost,
        onLoadMore: () => _loadMore(),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final item = bloc.posts[index];
            return CellItemView(
              leadingText: item.id.toString(),
              url: null,
              title: item.title,
              subtitle: item.body,
              tapToItem: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DetailDataPage(
                        url: null,
                        title: item.title,
                        subtitle: item.body,
                      );
                    },
                  ),
                );
              },
            );
          },
          itemCount: bloc.posts.length,
        ),
        whenEmptyLoad: false,
        delegate: const DefaultLoadMoreDelegate(),
        textBuilder: (status) {
          // DefaultLoadMoreTextBuilder.english;
          String text = '';
          switch (status) {
            case LoadMoreStatus.fail:
              text = "load fail, tap to retry";
              break;
            case LoadMoreStatus.idle:
              text = "wait for loading";
              break;
            case LoadMoreStatus.loading:
              text = "loading posts, wait for moment ...";
              break;
            case LoadMoreStatus.nomore:
              text = "no more data";
              break;
            default:
              text = "";
          }
          return text;
        },
      ),
      onRefresh: () => _refresh(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      builder: (context, state) {
        return _buildRefreshIndicator(context);
      },
      listener: (context, state) {},
    );
  }
}
