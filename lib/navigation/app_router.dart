
import 'package:flutter/material.dart';
import '../home.dart';
import '../models/models.dart';
import '../screens/favorite_screen.dart';
import '../screens/login_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/webview_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AppStateManager? appStateManager;
  final ProfileManager? profileManager;


  AppRouter(this.appStateManager, this.profileManager);

  late final router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: appStateManager,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: 'onboarding',
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        name: 'home',
        path: '/:tab',
        builder: (context, state) {
          final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
          return Home(key: state.pageKey, currentTab: tab);
        },
        routes: [

          GoRoute(
              name: 'profile',
              path: 'profile',
              builder: (context, state) {
                final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
                return ProfileScreen(
                    user: profileManager!.getUser, currentTab: tab);
              },
              routes: [
                GoRoute(
                  name: 'rw',
                  path: 'rw',
                  builder: (context, state) => const WebViewScreen(),
                ),
              ]
          ),
          //router to favorite
          GoRoute(
            name: 'favorite',
            path: 'favorite',
            builder: (context, state) {
              final tab = int.tryParse(state.params['tab'] ?? '') ?? 0;
              return FavoriteScreen(
                  currentTab: tab);
            },
          ),
        ],
      ),
    ],
    redirect: (state) {
      final loggedIn = appStateManager!.isLoggedIn;
      final loggingIn = state.subloc == '/login';
      if (!loggedIn) return loggingIn ? null : '/login';

      final isOnboardingComplete = appStateManager!.isOnboardingComplete;
      final onboarding = state.subloc == '/onboarding';
      if (!isOnboardingComplete) {
        return onboarding ? null : '/onboarding';
      }

      if (loggingIn || onboarding) return '/${FooderlichTab.explore}';
      return null;
    },
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
            ),
          ),
        ),
      );
    },
  );
}