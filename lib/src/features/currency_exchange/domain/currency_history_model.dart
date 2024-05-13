class HistoricalCurrencyData {
  final String? dateTime;
  final List<Currencies> currencies;

  HistoricalCurrencyData({required this.currencies, required this.dateTime});

  factory HistoricalCurrencyData.fromJson(Map<String, dynamic> data) {
    final Map<String, String> meta = data["meta"];
    final String? dateTime = meta["last_updated_at"];

    final Map<String, Map<String, dynamic>> currencyData = data["data"];

    List<Currencies> currenciesList = currencyData.entries.map((entry) {
      // String currencyCode = entry.key;
      Map<String, dynamic> currData = entry.value;
      return Currencies.fromJson(currData);
    }).toList();

    return HistoricalCurrencyData(
        currencies: currenciesList, dateTime: dateTime);
  }
}

class Currencies {
  final String code;
  final double value;

  Currencies({required this.code, required this.value});

  factory Currencies.fromJson(Map<String, dynamic> data) {
    final code = data["code"];
    final value = data["value"];

    return Currencies(code: code, value: value);
  }
}
