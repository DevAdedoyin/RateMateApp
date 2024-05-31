import 'dart:async';

import 'package:currnverter/src/constants/colors.dart';
import 'package:currnverter/src/constants/route_constants.dart';
import 'package:currnverter/src/features/currency_exchange/data/repositories/navbar_repo.dart';
import 'package:currnverter/src/features/currency_exchange/presentation/history_screen.dart';
import 'package:currnverter/src/features/currency_exchange/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/sizing/gaps.dart';
import '../../../../themes/theme_provider.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme(bool isOn) {
    setState(() {
      _themeMode = isOn ? ThemeMode.light : ThemeMode.dark;
    });
  }

  final _pages = [const HomeScreen(), const HistoryScreen()];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("DEVICE HEIGHT ${size.height}");
    final navPageNum = ref.watch(navPage);
    TextTheme textTheme = Theme.of(context).textTheme;
    final themeNotifier = ref.read(themeProvider);

    return Scaffold(
        appBar: AppBar(
          // elevation: 0,
          title: Text(
            "Currnverter",
            style: textTheme.headlineMedium,
          ),
          actions: [
            horizontalGaps(10.0),
            SizedBox(
              height: 35,
              width: 35,
              child: IconButton(
                  iconSize: 20,
                  padding: EdgeInsets.all(3),
                  onPressed: themeNotifier.toggleTheme,
                  icon: const Icon(
                    Icons.mode_night,
                    color: AppColors.secondaryColor,
                  )),
            ),
            horizontalGaps(10.0),
          ],
        ),
        body: _pages[navPageNum],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navPageNum,
          onTap: (index) {
            ref.read(navPage.notifier).state = index;
          },
          backgroundColor: Colors.black12,
          elevation: 0,
          selectedItemColor: Colors.black,
          unselectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
          // selectedFontSize: 16,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.currency_exchange,
              ),
              label: "Exchange",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month_rounded,
              ),
              label: "History",
            )
          ],
        ));
  }
}
