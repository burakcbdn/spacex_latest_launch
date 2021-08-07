import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final List gallery;
  const ImageView({Key? key, required this.gallery}) : super(key: key);

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: Container(
            width: screenSize.width,
            child: PageView(
              children: widget.gallery.map((imageURL) {
                return ImageItem(imageURL: imageURL);
              }).toList(),
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          child: Container(
            width: screenSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.gallery.map((item) {
                bool isCurrent = currentIndex == widget.gallery.indexOf(item);
                return Padding(
                  padding: const EdgeInsets.all(1.5),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isCurrent ? Colors.blue : Colors.white,
                        border: !isCurrent
                            ? Border.all(color: Colors.grey.withOpacity(0.5), width: 0.5)
                            : null),
                  ),
                );
              }).toList(),
            ),
          ),
        )
      ],
    );
  }
}

class ImageItem extends StatefulWidget {
  final String imageURL;
  const ImageItem({Key? key, required this.imageURL}) : super(key: key);

  @override
  _ImageItemState createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Image.network(widget.imageURL);
  }

  @override
  bool get wantKeepAlive => true;
}
