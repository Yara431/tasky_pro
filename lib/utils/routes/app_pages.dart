import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasky_pro/authentication/view/onboarding_view.dart';
import 'package:tasky_pro/authentication/view/sign_in_view.dart';
import 'package:tasky_pro/authentication/view/sign_up_view.dart';
import 'package:tasky_pro/utils/routes/app_links.dart';
import 'package:tasky_pro/view/home_view.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey plateKey = GlobalKey();

class AppPages{
  static final GoRouter routes = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppLinks.onBoarding,
    routes:[
      GoRoute(
      path: AppLinks.onBoarding,
      name: AppLinks.onBoarding,
      builder: (context,state)=> const OnboardingView()
      ),
      GoRoute(
      path: AppLinks.signIn,
      name: AppLinks.signIn,
      builder: (context,state)=> SignInView()
      ),
      GoRoute(path: AppLinks.signUp,
      name: AppLinks.signUp,
        builder: (context,state)=> SignUpView()
      ),
      GoRoute(path: AppLinks.homeView,
      name: AppLinks.homeView,
        builder: (context,state)=> HomeView()
      )
    ],
    errorBuilder: (context,state) => OnboardingView()
  );
}

void popUntilPath(BuildContext context, String routePath) {
  final router = GoRouter.of(context);
  while (
  router.routerDelegate.currentConfiguration.matches.last.matchedLocation !=
      routePath) {
    if (!context.canPop()) {
      return;
    }
    context.pop();
  }
}
