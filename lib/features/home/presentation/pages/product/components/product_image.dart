import 'package:flutter/material.dart';

final class ProductImage extends StatelessWidget {
  final String imageUrl;

  const ProductImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imageUrl,
      child: Image.network(
        "https:$imageUrl",
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}