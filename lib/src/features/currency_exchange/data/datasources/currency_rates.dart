import 'dart:convert';

import 'package:currnverter/src/exceptions/http_exceptions.dart';
import 'package:currnverter/src/features/currency_exchange/domain/currency_history_model.dart';
import 'package:currnverter/src/features/currency_exchange/domain/currency_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CurrencyConversionDataSource {
  static Future<CurrencyConversionModel> fetchCurrencyData(
      {required baseCurrency}) async {
    print(baseCurrency);
    try {
      final apiKey = dotenv.env['EXCHANGE_RATE_API_KEY'];
      String uri =
          "https://v6.exchangerate-api.com/v6/$apiKey/latest/$baseCurrency";

      final response = await http.get(Uri.parse(uri));

      print("BASE CURRENCY $baseCurrency");
      final responseBody = jsonDecode(response.body);
      print(responseBody);
      if (response.statusCode == 200) {
        return CurrencyConversionModel.fromJson(
            responseBody as Map<String, dynamic>);
      } else {
        print("Unabble to fetch data");
        throw HttpException(
          'Unable to fetch currency data. Please wait after some times and try again.',
        );
      }
    } catch (e) {
      print("EXCEPTION ${e.toString()}");
      throw HttpException(e.toString());
    }
  }

  static Future<HistoricalCurrencyData> fetchHistoricalData(
      {required baseCurrency, required date}) async {
    try {
      final apiKey = dotenv.env['HISTORICAL_EXCHANGE_RATE_API_KEY'];

      String uri =
          "https://api.currencyapi.com/v3/historical?apikey=$apiKey&base_currency=$baseCurrency&date=$date";
      final response = await http.get(Uri.parse(uri));

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print("HISTORY RESPONSE  $responseBody");
        return HistoricalCurrencyData.fromJson(
            responseBody as Map<String, dynamic>);
      } else {
        throw HttpException(
          'Unable to fetch currency historical data. Please wait after some times and try again.',
        );
      }
    } catch (e) {
      throw HttpException(
        e.toString(),
      );
    }
  }
}
