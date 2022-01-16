import 'package:flutter/material.dart';

class ImageForNotTransaction extends StatelessWidget {
  final String text;
  ImageForNotTransaction(this.text);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.title,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: constraints.maxHeight * 0.7,
            child: Image.asset(
              'assests/font/image/waiting.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ],
      );
    });
  }
}
