import 'package:currnverter/src/constants/colors.dart';
import 'package:date_picker_plus/date_picker_plus.dart';

import 'package:flutter/material.dart';

import '../features/currency_exchange/data/datasources/currency_codes.dart';

class CountryCodePicker {
  static Future selectCountry(BuildContext context) async {
    final date = await showModalBottomSheet(
        context: context,
        builder: (_) {
          return ListView.builder(
            itemBuilder: (_, index) {
              return Column(
                children: [
                  ListTile(
                    dense: true,
                    leading: Text(
                        CurrencyCodes.currencyFlagMap.keys.elementAt(index),
                        style: const TextStyle(fontSize: 14)),
                    trailing: Text(
                        CurrencyCodes.currencyFlagMap.values.elementAt(index),
                        style: const TextStyle(fontSize: 17)),
                    onTap: () {},
                  ),
                  Divider()
                ],
              );
            },
            itemCount: CurrencyCodes.currencyFlagMap.length,
          );
        });
  }
}
