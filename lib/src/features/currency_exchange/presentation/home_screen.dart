import 'package:currnverter/src/constants/colors.dart';
import 'package:currnverter/src/constants/sizing/gaps.dart';
import 'package:currnverter/src/features/currency_exchange/presentation/currency_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          // elevation: 0,
          title: Text(
            "Currnverter",
            style: textTheme.headlineMedium,
          ),
          actions: [
            SizedBox(
              height: 35,
              width: 35,
              child: IconButton(
                  iconSize: 20,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.calendar_month,
                    color: AppColors.secondaryColor,
                  )),
            ),
            horizontalGaps(10.0),
            SizedBox(
              height: 35,
              width: 35,
              child: IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.all(3),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.mode_night,
                    color: AppColors.secondaryColor,
                  )),
            ),
            horizontalGaps(10.0),
          ],
        ),
        body: SizedBox(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.maxFinite,
                  height: size.height * 0.35,
                  child: const Stack(children: [
                    Positioned(
                        child: CurrencySelector(
                      state: "From",
                      currency: "EUR",
                      country: "Euro",
                    )),
                    Positioned(
                        right: 0,
                        child: CurrencySelector(
                          state: "To",
                          currency: "USD",
                          country: "Us Dollar",
                        )),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
