import 'package:flutter/material.dart';

class OnboardingPages extends StatelessWidget {
  final String description;
  final String image;

  const OnboardingPages(
      {required this.image, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40, bottom: 30),
            width: size.width * 0.7,
            child: Text(
              description,
              style: textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Image.asset(
            image,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
