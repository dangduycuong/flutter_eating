import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_eating/posts/bloc/post_bloc.dart';
import 'package:flutter_eating/posts/model/post_load_data_state_model.dart';
import 'package:flutter_eating/posts/model/post_model.dart';
import 'package:flutter_eating/posts/views/post_detail_page.dart';
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
    bloc = context.read<PostBloc>();
    bloc.add(LoadPostsEvent());
    super.initState();
  }

  Future<bool> _loadMore() async {
    bloc.add(LoadPostsEvent());
    return true;
  }

  Future<void> _refresh() async {
    bloc.add(RefreshPostsEvent());
  }

  Widget _listPostView(BuildContext context) {
    return RefreshIndicator(
      child: LoadMore(
        isFinish: bloc.stopLoadPost,
        onLoadMore: () => _loadMore(),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return _postItemView(bloc.posts[index]);
          },
          itemCount: bloc.posts.length,
        ),
        whenEmptyLoad: false,
        delegate: const DefaultLoadMoreDelegate(),
        textBuilder: DefaultLoadMoreTextBuilder.chinese,
      ),
      onRefresh: () => _refresh(),
    );
  }

  Widget _postItemView(PostModel item) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PostDetailPage.routeName, arguments: item);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Padding(
              child: Text('${item.id}'),
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${item.title}',
                      maxLines: 1,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${item.body}',
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
                size: 16,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostBloc, PostState>(
      builder: (context, state) {
        Widget widget = const SizedBox(
          height: 4,
        );
        if (state is PostFetchDataState) {
          if (state.status == PostLoadDataStateModel.loading) {
            widget = const Center(child: CircularProgressIndicator());
          }
        }

        return Column(
          children: [
            Expanded(
              child: _listPostView(context),
            ),
            widget,
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}
