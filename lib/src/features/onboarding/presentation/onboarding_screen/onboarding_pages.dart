import 'package:flutter/material.dart';

class OnboardingPages extends StatelessWidget {
  final String description;
  final String image;

  const OnboardingPages(
      {required this.image, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [Text(description), Image.asset(image)],
      ),
    );
  }
}
