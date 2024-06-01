import 'package:currnverter/src/constants/colors.dart';
import 'package:currnverter/src/constants/sizing/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/date_picker.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
                    onPressed: () {
                      CurrencyDatePicker.selectDate(context);
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
                    onPressed: () {},
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
              text:  TextSpan(
                  style: TextStyle(
                      color: isDarkMode ? Colors.white  : Colors.black,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                  children: const [
                    TextSpan(text: "Exchange Rate for "),
                    TextSpan(
                        text: "USD ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontStyle: FontStyle.normal)),
                    TextSpan(text: "to Other Currencies as of "),
                    TextSpan(
                        text: "Thursday, May 12, 2024, ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontStyle: FontStyle.normal)),
                    TextSpan(text: "at "),
                    TextSpan(
                        text: "10:00 AM GMT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontStyle: FontStyle.normal))
                  ]),
            ),
          ),
          Expanded(
              child: SizedBox(
            child: ListView.builder(
                itemCount: 8,
                itemBuilder: (_, index) {
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
                              color: Colors.white70,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "USD",
                                  textAlign: TextAlign.center,
                                  style: textTheme.bodyMedium,
                                ),
                              )),
                        ),
                        title: const Text("0.76585"),
                        subtitle: const Text("1USD = GBP 0.7685"),
                        trailing: SizedBox(
                          height: 47,
                          width: 47,
                          child: Card(
                            color: Colors.white70,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "GBP",
                                  textAlign: TextAlign.center,
                                  style: textTheme.bodyMedium,
                                ),
                              )),
                        ),
                      ),
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }
}
