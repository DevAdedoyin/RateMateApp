import 'package:currnverter/src/constants/colors.dart';
import 'package:flutter/material.dart';

class CurrencySelector extends StatelessWidget {
  final String state;
  final String currency;
  final String country;
  final Function selectCountry;

  const CurrencySelector(
      {required this.state,
      required this.currency,
      required this.country,
      required this.selectCountry,
      super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () => selectCountry(),
      child: SizedBox(
        height: size.height * 0.28,
        width: size.width * 0.45,
        child: Card(
          color: isDarkMode ? Colors.black12 : Colors.white70,
          elevation: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(state, style:  TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54)),
              Text(country, style: const TextStyle(fontSize: 40)),
              const Icon(Icons.keyboard_arrow_down_rounded),
              Text(
                currency,
                style:  TextStyle(color: isDarkMode ? Colors.white : Colors.black87, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
