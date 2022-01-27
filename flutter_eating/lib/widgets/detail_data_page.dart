import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eating/widgets/youtube_player_demo_page.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailDataPage extends StatefulWidget {
  const DetailDataPage(
      {Key? key, required this.url, required this.title, this.subtitle})
      : super(key: key);

  static const routeName = 'DetailDataPage';

  final String? url;
  final String? title;
  final String? subtitle;

  @override
  _DetailDataPageState createState() => _DetailDataPageState();
}

class _DetailDataPageState extends State<DetailDataPage> {
  Widget _buildImageView(String? url) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context, YoutubePlayerDemoPage.routeName);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          placeholder: (context, url) => const CircularProgressIndicator(),
          imageUrl: url ??
              'https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildImageView(widget.url),
              const SizedBox(
                height: 16,
              ),
              Text(
                '${widget.subtitle}',
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.bodyText1,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
