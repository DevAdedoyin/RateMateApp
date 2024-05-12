import 'dart:convert';

import 'package:currnverter/src/exceptions/http_exceptions.dart';
import 'package:currnverter/src/features/currency_exchange/domain/currency_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CurrencyConversionDataSource {
  static Future<CurrencyConversionModel> fetchCurrencyData(
      {required baseRate}) async {
    try {
      final apiKey = dotenv.env['EXCHANGE_RATE_API_KEY'];

      String uri =
          "https://v6.exchangerate-api.com/v6/$apiKey/latest/$baseRate";
      final response = await http.get(Uri.parse(uri));

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return CurrencyConversionModel.fromJson(
            responseBody as Map<String, dynamic>);
      } else {
        throw HttpException(
          'Failed to fetch currency data.',
        );
      }
    } catch (e) {
      throw HttpException(
        e.toString(),
      );
    }
  }
}
