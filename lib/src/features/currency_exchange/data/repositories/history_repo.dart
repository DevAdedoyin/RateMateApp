


import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyBaseCurrency = StateProvider<Map<String, String>>(
        (ref) =>{"currency": "GBP", "flag": "🇬🇧"} );

final historyTargetCurrencies = StateProvider<Map<String, String>>(
        (ref) => {"currency": "USD", "flag": "🇺🇸"});

final targetValues = StateProvider<double>((ref) => 0.79);

final selectedDate = StateProvider<String>(
        (ref) => "");

final selectedTime = StateProvider<String>(
        (ref) => "");
