import 'package:flutter/material.dart';

class CurrencySelector extends StatelessWidget {
  final String state;
  final String currency;
  final String country;

  const CurrencySelector(
      {required this.state,
      required this.currency,
      required this.country,
      super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: size.height * 0.30,
      width: size.width * 0.45,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(state),
            Text(
              currency,
              style: textTheme.headlineMedium,
            ),
            const Icon(Icons.keyboard_arrow_down_rounded),
            Text(
              country,

            ),
          ],
        ),
      ),
    );
  }
}
