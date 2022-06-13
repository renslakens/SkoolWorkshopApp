import 'dart:io';
import 'package:flutter/material.dart';
import 'package:skoolworkshop/colors.dart';

class ProfilePictureWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfilePictureWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(bottom: 95, right: 6, child: buildEditIcon(HeeboColor))
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
    color: backgroundColor,
    all: 4.5,
    child: buildCircle(
          color: color,
          all: 4,
          child: const Icon(
            Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
  );

  Widget buildCircle(
          {required Color color, required Widget child, required double all}) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
