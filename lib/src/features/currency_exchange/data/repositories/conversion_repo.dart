import 'package:flutter_riverpod/flutter_riverpod.dart';

final baseCurrency = StateProvider<Map<String, String>>(
    (ref) => {"currency": "USD", "flag": "🇺🇸"});

final targetCurrency = StateProvider<Map<String, String>>(
    (ref) => {"currency": "GBP", "flag": "🇬🇧"});

final targetValue = StateProvider<double>((ref) => 0.79);
