import 'package:flutter/material.dart';

class PersonStacker extends StatelessWidget {
  final List<String> images;
  final int maxPerson;
  const PersonStacker({this.maxPerson = 4, required this.images});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ...images
            .getRange(0, maxPerson)
            .toList()
            .asMap()
            .map((index, image) => MapEntry(index, Person(index, image: image)))
            .values
            .toList(),

      ],
    );
  }
}

class Person extends StatelessWidget {
  final int index;
  final String image;
  final Color colorBorder;
  final double size = 24;
  final double offset = 10;

  const Person(this.index,
      {this.colorBorder = Colors.white, required this.image});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: index * offset,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          border: Border.all(width: 1, color: colorBorder),
          borderRadius: BorderRadius.circular(size),
        ),
        child: Container(),
      ),
    );
  }
}
