import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class PickImageOrVideoCard extends StatelessWidget {
  const PickImageOrVideoCard({
    super.key,
    this.imageToPost,
    this.videoToPost,
  });

  final File? imageToPost;
  final Uint8List? videoToPost;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Widget content = Container(
      width: size.width * 0.9,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset(
        'assets/images/food_horizontal.jpg',
        fit: BoxFit.fill,
      ),
    );
    if (videoToPost != null) {
      content = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.memory(
          videoToPost!,
          fit: BoxFit.cover,
        ),
      );
    } else if (imageToPost != null) {
      content = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.file(
          imageToPost!,
          fit: BoxFit.cover,
        ),
      );
    }
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Center(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
