import 'package:currnverter/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/onboarding_model.dart';
import 'onboarding_pages.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  static List<OnboardingPages> listOfOnboardingPages = OnboardingModel
      .listOfOnboardingModel
      .map((e) => OnboardingPages(image: e.image, description: e.header))
      .toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SizedBox(
            child: Column(
      children: [
        Expanded(
          flex: 8,
          child: PageView(
            children: listOfOnboardingPages.map((e) => e).toList(),
          ),
        ),
        Expanded(
            flex: 1,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: listOfOnboardingPages
                    .map((e) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.primaryColors)))
                    .toList(),
              ),
            )),
        Expanded(
            flex: 1,
            child: SizedBox(
              child: ElevatedButton(onPressed: () {}, child: Text("Next")),
            )),
        SizedBox(
          height: 10,
        )
      ],
    )));
  }
}
