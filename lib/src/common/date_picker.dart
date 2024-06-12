import 'package:currnverter/src/constants/colors.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyDatePicker {
  static Future<Map<String, String>> selectDate(BuildContext context) async {
    Map<String, String> selectedDate = {"date": "", "time": ""};
    final date = await showDatePickerDialog(
      context: context,
      initialDate: DateTime.now(),
      minDate: DateTime(2020, 10, 10),
      maxDate: DateTime.now(),
      width: 300,
      height: 300,
      barrierDismissible: false,
      currentDate: DateTime.now(),
      selectedDate: DateTime(2022, 10, 16),
      currentDateDecoration: const BoxDecoration(
          color: AppColors.primaryColors,
          border: Border(),
          shape: BoxShape.circle),
      currentDateTextStyle: const TextStyle(color: Colors.white),
      daysOfTheWeekTextStyle: const TextStyle(),
      disabledCellsDecoration: const BoxDecoration(),
      disabledCellsTextStyle:
          const TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
      enabledCellsDecoration: const BoxDecoration(),
      enabledCellsTextStyle: const TextStyle(),
      initialPickerType: PickerType.days,
      selectedCellDecoration: const BoxDecoration(),
      selectedCellTextStyle: const TextStyle(),
      leadingDateTextStyle: const TextStyle(),
      slidersColor: AppColors.primaryColors,
      highlightColor: Colors.redAccent,
      slidersSize: 20,
      splashColor: Colors.lightBlueAccent,
      splashRadius: 40,
      centerLeadingDate: true,
    );
    print("DATE $date");
    String strDate = date.toString();
    // Parse the original date string
    DateTime dateTime = DateTime.parse(strDate);

    // Convert to desired time zone (GMT/UTC)
    // dateTime = dateTime.toUtc();

    // Create a DateFormat for the desired output format
    DateFormat dateFormatter = DateFormat('EEEE, MMMM d, y');
    DateFormat timeFormatter = DateFormat('hh:mm a \'GMT\'');

    // Format the DateTime object separately for date and time
    String formattedDate = dateFormatter.format(dateTime);
    String formattedTime = timeFormatter.format(dateTime);

    // Print or use the formatted strings
    print('Date: $formattedDate'); // Output: Date: Sunday, June 2, 2024
    print('Time: $formattedTime'); // Output: Time: 01:00 AM GMT
    return {"date": formattedDate, "time": formattedTime};
  }
}
