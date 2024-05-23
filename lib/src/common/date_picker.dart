import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class CurrencyDatePicker {
  static Future selectDate(BuildContext context) async {
    final date = await showDatePickerDialog(
      context: context,
      initialDate: DateTime(2022, 10, 10),
      minDate: DateTime(2020, 10, 10),
      maxDate: DateTime(2024, 10, 30),
      width: 300,
      height: 300,
      currentDate: DateTime(2022, 10, 15),
      selectedDate: DateTime(2022, 10, 16),
      currentDateDecoration: const BoxDecoration(),
      currentDateTextStyle: const TextStyle(),
      daysOfTheWeekTextStyle: const TextStyle(),
      disabledCellsDecoration: const BoxDecoration(),
      disabledCellsTextStyle: const TextStyle(),
      enabledCellsDecoration: const BoxDecoration(),
      enabledCellsTextStyle: const TextStyle(),
      initialPickerType: PickerType.days,
      selectedCellDecoration: const BoxDecoration(),
      selectedCellTextStyle: const TextStyle(),
      leadingDateTextStyle: const TextStyle(),
      slidersColor: Colors.lightBlue,
      highlightColor: Colors.redAccent,
      slidersSize: 20,
      splashColor: Colors.lightBlueAccent,
      splashRadius: 40,
      centerLeadingDate: true,
    );
  }
}

