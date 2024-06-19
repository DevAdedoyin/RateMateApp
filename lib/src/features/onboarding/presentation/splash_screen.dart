import 'dart:async';

import 'package:currnverter/src/constants/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  double _opacity = 0.2;
  bool _visibility = false;
  double _smallSize = 70;
  double _bigSize = 100;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        // _visibility = true;
        _opacity = 1.0;
        _smallSize = 180;
        _bigSize = 200;
      });
      Future.delayed(
        const Duration(milliseconds: 5000),
        () {
          context.go(Routes.onboarding);
        },
      );
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("DEVICE HEIGHT ${size.height}");
    return Scaffold(
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            AnimatedContainer(
              height: size.height < 690 ? _smallSize : _bigSize,
              width: size.height < 690 ? _smallSize : _bigSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              duration: const Duration(milliseconds: 5000),
              child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(milliseconds: 4000),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        "assets/images/logo.PNG",
                        fit: BoxFit.contain,
                      ))),
            )
          ]),
        ));
  }
}
