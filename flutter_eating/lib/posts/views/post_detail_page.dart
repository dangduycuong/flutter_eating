import 'package:flutter/material.dart';
import 'package:flutter_eating/posts/model/post_model.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({Key? key}) : super(key: key);
  static const routeName = 'PostDetailPage';

  @override
  Widget build(BuildContext context) {
    final PostModel post =
        ModalRoute.of(context)?.settings.arguments as PostModel;
    return Scaffold(
      appBar: AppBar(
        title: Text('${post.title}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Text(
            '${post.body}',
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.headline2,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}
