class HistoricalCurrencyData {
  final String? dateTime;
  final List<Currencies> currencies;

  HistoricalCurrencyData({required this.currencies, required this.dateTime});

  factory HistoricalCurrencyData.fromJson(Map<String, dynamic> data) {
    final Map<String, dynamic> meta = data["meta"];
    print("CURRENCY META $meta");
    print("DATA CURR ${data["data"]}");
    final String? dateTime = meta["last_updated_at"];

    final currencyData = data["data"] as Map<String, dynamic>;

    print("CURRENCY DATA ${currencyData.length}");

    List<Currencies> currenciesList = currencyData.entries.map((entry) {
      // String currencyCode = entry.key;
      print("keys ${entry.value}");
      Map<String, dynamic> currData = entry.value;
      return Currencies.fromJson(currData);
    }).take(20).toList();

    print("CURRENCY LIST $currenciesList");

    return HistoricalCurrencyData(
        currencies: currenciesList, dateTime: dateTime);
  }
}

class Currencies {
  final String code;
  final double value;

  Currencies({required this.code, required this.value});

  factory Currencies.fromJson(Map<String, dynamic> data) {
    final String code = data["code"];
    final double value = data["value"];

    return Currencies(code: code, value: value);
  }

  @override
  String toString() {
    return 'Currencies{code: $code, value: $value}';
  }
}
