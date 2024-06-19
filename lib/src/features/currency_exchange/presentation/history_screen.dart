import 'package:currnverter/src/constants/colors.dart';
import 'package:currnverter/src/constants/sizing/gaps.dart';
import 'package:currnverter/src/utility/datetime_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../common/date_picker.dart';
import '../../../common/modal_sheet.dart';
import '../data/datasources/currency_rates.dart';
import '../data/repositories/history_repo.dart';
import '../domain/currency_history_model.dart';
import '../domain/currency_model.dart';
import 'package:shimmer/shimmer.dart';

import 'connection_loader_widget.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  String historicDate = "";
  String historicTime = "";
  late Future<HistoricalCurrencyData> _historyCurrencyDataFuture;
  static const _pageSize = 20; // Number of items to fetch per page
  int _currentPage = 0; // Current page index
  bool _loading = false; // Loading indicator

  List<Currencies> _currenciesList = []; // List to hold fetched currencies

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateDateTime();
    // _updateHistoryCurrencyDataFuture();
    _loadCurrencies();
  }

  Future<void> _loadCurrencies() async {
    if (_loading) return;

    setState(() {
      _loading = true;
    });

    try {
      final baseCurrency = ref.read(historyBaseCurrency)["currency"];
      final newCurrencies =
          await CurrencyConversionDataSource.fetchHistoricalData(
        baseCurrency: baseCurrency,
        date: historicDate,
        pageKey: _currentPage,
        pageSize: _pageSize,
      );

      setState(() {
        _currenciesList.addAll(newCurrencies.currencies);
        _loading = false;
        _currentPage++;
      });
    } catch (e) {
      setState(() {
        _loading = false;
      });
      // Handle error fetching data
      print('Error fetching currencies: $e');
      // Optionally show error message to user
    }
  }

  Future<void> _refreshCurrencies() async {
    _currentPage = 0;
    _currenciesList.clear();
    await _loadCurrencies();
  }

  // void _updateHistoryCurrencyDataFuture() {
  //   final baseCurrency_ = ref.read(historyBaseCurrency);
  //   setState(() {
  //     _historyCurrencyDataFuture =
  //         CurrencyConversionDataSource.fetchHistoricalData(
  //       baseCurrency: baseCurrency_["currency"],
  //       date: historicDate,
  //     );
  //   });
  // }

  void generateDateTime() {
    // Get the current date and time
    DateTime now = DateTime.now();

    // Subtract one day to get yesterday's date
    DateTime yesterday = now.subtract(const Duration(days: 1));

    // Format the date as "Thursday, May 12, 2024"
    String formattedDate = DateFormat('EEEE, MMMM d, y').format(yesterday);

    // Format the time as "00:00 AM GMT"
    DateTime specificTimeYesterday =
        DateTime(yesterday.year, yesterday.month, yesterday.day, 00, 0);
    String formattedTime =
        '${DateFormat('h:mm a').format(specificTimeYesterday)} GMT';

    // Print the formatted date and time
    print('date: $formattedDate,');
    print('time: $formattedTime');

    historicDate = formattedDate;
    historicTime = formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final selectedDate_ = ref.watch(selectedDate);
    final selectedTime_ = ref.watch(selectedTime);
    final historyBaseCurrency_ = ref.watch(historyBaseCurrency);

    String parsedDateTime = DateTimeUtils.timeAgo(
        selectedDate_ == "" ? historicDate : selectedDate_);

    return Padding(
      padding: const EdgeInsets.only(top: 2, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: Text(
              "Historical Currency Exchange Rate",
              style: textTheme.titleMedium,
            ),
          ),
          verticalGaps(5.0),
          SizedBox(
            // height: size.height * 0.10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryColors),
                    ),
                    onPressed: () async {
                      Map<String, String> selectedDateTime = {
                        "date": "",
                        "time": ""
                      };
                      selectedDateTime =
                          await CurrencyDatePicker.selectDate(context);
                      ref.read(selectedDate.notifier).state =
                          selectedDateTime["date"]!;
                      ref.read(selectedTime.notifier).state =
                          selectedDateTime["time"]!;
                      // _updateHistoryCurrencyDataFuture();
                      _refreshCurrencies();
                    },
                    icon: const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Select date",
                      style: TextStyle(color: Colors.white),
                    )),
                TextButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryColors),
                    ),
                    onPressed: () async {
                      Map<String, String> currency = {};
                      currency = await CountryCodePicker.selectCountry(context);
                      ref.read(historyBaseCurrency.notifier).state = {
                        "currency": currency["currency"]!,
                        "flag": currency["flag"]!
                      };
                      // CurrencyConversionDataSource.fetchHistoricalData(
                      //   baseCurrency: currency["currency"],
                      //   date: ref.read(selectedDate.notifier).state,
                      // );
                      // _updateHistoryCurrencyDataFuture();
                      _refreshCurrencies();
                    },
                    icon: const Icon(
                      Icons.money,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Select source currency",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
          verticalGaps(5.0),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(5),
            child: RichText(
              text: TextSpan(
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                  children: [
                    const TextSpan(text: "Exchange rate for "),
                    TextSpan(
                        text:
                            "${historyBaseCurrency_['currency']} ${historyBaseCurrency_['flag']} ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontStyle: FontStyle.normal)),
                    const TextSpan(text: "to other currencies as of "),
                    TextSpan(
                        text:
                            "${selectedDate_ == "" ? historicDate : selectedDate_}, ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontStyle: FontStyle.normal)),
                    const TextSpan(text: "at "),
                    TextSpan(
                        text:
                            selectedTime_ == "" ? historicTime : selectedTime_,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontStyle: FontStyle.normal))
                  ]),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshCurrencies,
              child: ListView.builder(
                itemCount: _currenciesList.length + (_loading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index < _currenciesList.length) {
                    final currency = _currenciesList[index];
                    return SizedBox(
                      child: Card(
                        color: Colors.black12,
                        elevation: 0,
                        child: ListTile(
                          leading: SizedBox(
                            height: 45,
                            width: 45,
                            child: Card(
                              elevation: 5,
                              color: AppColors.secondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "${historyBaseCurrency_['flag']}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          subtitle: Text(
                            parsedDateTime,
                            style: const TextStyle(
                                fontSize: 12.5, fontStyle: FontStyle.italic),
                          ),
                          title: Text(
                            "1 ${historyBaseCurrency_['currency']} = ${currency.value.toStringAsFixed(2)} ${currency.code}",
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          trailing: SizedBox(
                            height: 47,
                            width: 47,
                            child: Card(
                              color: AppColors.secondaryColor,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "${currency.code}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else if (_loading) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return SizedBox(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Something went wrong."),
                        verticalGaps(20.0),
                        const Text(
                            "Please try again by pulling down to refresh the page.")
                      ],
                    ));
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
