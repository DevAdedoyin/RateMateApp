import 'package:currnverter/src/constants/route_constants.dart';
import 'package:currnverter/src/features/currency_exchange/presentation/history_screen.dart';
import 'package:currnverter/src/features/currency_exchange/presentation/home_screen.dart';
import 'package:currnverter/src/features/onboarding/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:currnverter/src/features/onboarding/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: Routes.onboarding,
    builder: (context, state) => const OnboardingScreen(),
  ),
  GoRoute(
    path: Routes.home,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: Routes.history,
    builder: (context, state) => const HistoryScreen(),
  ),
]);
