import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

typedef TapToItem = Function();

class CellItemView extends StatefulWidget {
  const CellItemView(
      {Key? key,
      required this.leadingText,
      required this.url,
      required this.title,
      required this.subtitle,
      required this.tapToItem})
      : super(key: key);

  final String? leadingText;
  final String? url;
  final String? title;
  final String? subtitle;
  final TapToItem tapToItem;

  @override
  _CellItemViewState createState() => _CellItemViewState();
}

class _CellItemViewState extends State<CellItemView> {
  Widget _buildLeadingImage(String? url) {
    return ClipOval(
      child: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageUrl: url ??
            'https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg',
        width: 48,
        height: 48,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _leadingItem() {
    return Text(
      '${widget.leadingText}',
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildDataItem() {
    return InkWell(
      onTap: widget.tapToItem,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            // color: Colors.blue.withOpacity(0.3),
            color: Colors.deepOrange.shade900,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            const SizedBox(width: 8),
            widget.url == null
                ? _leadingItem()
                : _buildLeadingImage(widget.url),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${widget.title}',
                      maxLines: 1,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${widget.subtitle}',
                      style: const TextStyle(color: Colors.white),
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
                color: Colors.white,
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
    return _buildDataItem();
  }
}
