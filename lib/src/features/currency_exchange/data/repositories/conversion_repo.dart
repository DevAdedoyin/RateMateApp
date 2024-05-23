import 'package:flutter_riverpod/flutter_riverpod.dart';

final baseCurrency = StateProvider<Map<String, String>>(
    (ref) => {"currency": "USD", "flag": "🇺🇸"});

final targetCurrency =
    StateProvider<Map<String, String>>((ref) => {"GBP": "GB"});
