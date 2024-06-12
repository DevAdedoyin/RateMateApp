import 'package:currnverter/src/constants/colors.dart';
import 'package:currnverter/src/constants/sizing/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../common/date_picker.dart';
import '../data/repositories/history_repo.dart';


class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {

  String historicDate = "";
  String historicTime = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateDateTime();
  }

  void generateDateTime(){
    // Get the current date and time
    DateTime now = DateTime.now();

    // Subtract one day to get yesterday's date
    DateTime yesterday = now.subtract(Duration(days: 1));

    // Format the date as "Thursday, May 12, 2024"
    String formattedDate = DateFormat('EEEE, MMMM d, y').format(yesterday);

    // Format the time as "00:00 AM GMT"
    // Assuming you want a specific time (10:00 AM) instead of the current time
    DateTime specificTimeYesterday = DateTime(yesterday.year, yesterday.month, yesterday.day, 00, 0);
    String formattedTime = DateFormat('h:mm a').format(specificTimeYesterday) + ' GMT';

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
                      Map<String, String> selectedDateTime = {"date": "", "time": ""};
                      selectedDateTime = await CurrencyDatePicker.selectDate(context);
                      ref.read(selectedDate.notifier).state = selectedDateTime["date"]!;
                      ref.read(selectedTime.notifier).state = selectedDateTime["time"]!;
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
                  children:  [
                    const TextSpan(text: "Exchange rate for "),
                    const  TextSpan(
                        text: "USD ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontStyle: FontStyle.normal)),
                    const   TextSpan(text: "to other currencies as of "),
                    TextSpan(
                        text: "${selectedDate_ == "" ? historicDate : selectedDate_}, ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontStyle: FontStyle.normal)),
                    const   TextSpan(text: "at "),
                    TextSpan(
                        text: selectedTime_ == "" ? historicTime : selectedTime_,
                        style:const TextStyle(
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
