import 'package:currnverter/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Currnverter",
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.calendar_month,
                  color: AppColors.secondaryColor,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mode_night,
                  color: AppColors.secondaryColor,
                )),
          ],
        ),
        body: SizedBox(
          child: Column(
            children: [],
          ),
        ));
  }
}
