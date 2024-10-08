import 'package:currnverter/src/constants/colors.dart';
import 'package:currnverter/src/features/currency_exchange/domain/currency_model.dart';
import 'package:date_picker_plus/date_picker_plus.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/currency_exchange/data/datasources/currency_codes.dart';

class CountryCodePicker {
  static Future<Map<String, String>> selectCountry(BuildContext context,
      {Future<CurrencyConversionModel>? fetchCurreny}) async {
    Map<String, String> selectedCurrency = {"currency": "", "flag": ""};
    final date = await showModalBottomSheet(
        context: context,
        enableDrag: true,
        isDismissible: false,
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
                    onTap: () {
                      selectedCurrency = {
                        "currency":
                            CurrencyCodes.currencyFlagMap.keys.elementAt(index),
                        "flag": CurrencyCodes.currencyFlagMap.values
                            .elementAt(index)
                      };
                      fetchCurreny;
                      context.pop();
                    },
                  ),
                  const Divider()
                ],
              );
            },
            itemCount: CurrencyCodes.currencyFlagMap.length,
          );
        });
    return selectedCurrency;
  }
}
