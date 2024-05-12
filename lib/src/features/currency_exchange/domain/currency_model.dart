class CurrencyConversionModel {
  final String time_last_update_utc;
  final String time_next_update_utc;
  final String base_code;
  final Map<String, dynamic> conversionRates;

  CurrencyConversionModel(
      {required this.base_code,
      required this.conversionRates,
      required this.time_last_update_utc,
      required this.time_next_update_utc});

  factory CurrencyConversionModel.fromJson(Map<String, dynamic> data) {
    final time_last_update_utc = data["time_last_update_utc"];
    final time_next_update_utc = data["time_next_update_utc"];
    final base_code = data["base_code"];
    final conversionRates = data["conversion_rates"];

    return CurrencyConversionModel(
        base_code: base_code,
        conversionRates: conversionRates,
        time_last_update_utc: time_last_update_utc,
        time_next_update_utc: time_next_update_utc);
  }
}
