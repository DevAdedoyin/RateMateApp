import 'package:currnverter/src/features/onboarding/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:currnverter/src/features/onboarding/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const SplashScreen(),),
   GoRoute(
    path: '/',
    builder: (context, state) => const OnboardingScreen(),
  ),
   GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
   GoRoute(
    path: '/',
    builder: (context, state) => const HistoryScreen(),
  ),
]);
