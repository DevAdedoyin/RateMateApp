import 'package:currnverter/src/constants/colors.dart';
import 'package:currnverter/src/constants/route_constants.dart';
import 'package:currnverter/src/features/onboarding/data/repository/onboarding_page_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/onboarding_model.dart';
import 'onboarding_pages.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  static List<OnboardingPages> listOfOnboardingPages = OnboardingModel
      .listOfOnboardingModel
      .map((e) => OnboardingPages(image: e.image, description: e.header))
      .toList();

  static PageController _pageController = PageController();
  static int index = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    final pageIndex = ref.watch(currentPage);
    return Scaffold(
        body: SizedBox(
            child: Column(
      children: [
        Expanded(
          flex: 8,
          child: PageView(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (currentPageIndex) {
              ref.read(currentPage.notifier).state = currentPageIndex;
            },
            children: listOfOnboardingPages.map((e) => e).toList(),
          ),
        ),
        Expanded(
            flex: 1,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: listOfOnboardingPages
                    .asMap()
                    .entries
                    .map((e) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        alignment: Alignment.center,
                        height: pageIndex == e.key ? 10 : 7,
                        width: pageIndex == e.key ? 10 : 7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            color: pageIndex == e.key
                                ? AppColors.primaryColors
                                : AppColors.inActiveColor)))
                    .toList(),
              ),
            )),
        SizedBox(
          width: size.width * 0.5,
          child: ElevatedButton(
              onPressed: () {
                switch (pageIndex) {
                  case 0:
                    ref.read(currentPage.notifier).state =
                        ref.read(currentPage.notifier).state + 1;
                    _pageController
                        .jumpToPage(ref.read(currentPage.notifier).state);
                    break;
                  case 1:
                    ref.read(currentPage.notifier).state =
                        ref.read(currentPage.notifier).state + 1;
                    _pageController
                        .jumpToPage(ref.read(currentPage.notifier).state);
                    break;
                  default:
                    context.go(Routes.home);
                }
              },
              child: Text(pageIndex == 2 ? "Get started" : "Next")),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    )));
  }
}
