import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AvatarView extends StatelessWidget {
  const AvatarView({Key? key, required this.size, required this.url})
      : super(key: key);

  final double size;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      width: size,
      height: size,
    ).cornerRadius(size);
  }
}
