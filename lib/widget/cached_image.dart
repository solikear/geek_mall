import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';        
class CachedImageView extends StatelessWidget {
  double width;
  double height;
  String url;

  CachedImageView(this.width, this.height, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      alignment: Alignment.center,
      child: ExtendedImage.network(
        this.url,
        fit: BoxFit.fill,
        width: this.width,
        height: this.height,
      ),
    );
  }
}
