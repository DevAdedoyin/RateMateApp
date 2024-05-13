class CurrencyConversionModel {
  final String timeLastUpdateUtc;
  final String timeNextUpdateUtc;
  final String baseCode;
  final Map<String, dynamic> conversionRates;

  CurrencyConversionModel(
      {required this.baseCode,
      required this.conversionRates,
      required this.timeLastUpdateUtc,
      required this.timeNextUpdateUtc});

  factory CurrencyConversionModel.fromJson(Map<String, dynamic> data) {
    final timeLastUpdateUtc = data["time_last_update_utc"];
    final timeNextUpdateUtc = data["time_next_update_utc"];
    final baseCode = data["base_code"];
    final conversionRates = data["conversion_rates"];

    return CurrencyConversionModel(
        baseCode: baseCode,
        conversionRates: conversionRates,
        timeLastUpdateUtc: timeLastUpdateUtc,
        timeNextUpdateUtc: timeNextUpdateUtc);
  }
}
