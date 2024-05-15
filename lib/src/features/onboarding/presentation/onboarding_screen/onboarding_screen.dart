import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/onboarding_model.dart';
import 'onboarding_pages.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  static List<OnboardingPages> listOfOnboardingPages = OnboardingModel
      .listOfOnboardingModel.map((e) =>
      OnboardingPages(image: e.image, description: e.header)).toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SizedBox(
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: PageView(
                    children: listOfOnboardingPages.map((e) => e).toList(),
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
                Expanded(flex: 2, child: SizedBox()),
              ],
            )));
  }
}
