import 'package:unila_data/models/ProfileManager.dart';
import 'package:unila_data/models/app_state_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:unila_data/screen/splash_screen.dart';
import '../home.dart';


class AppRoute{
  final AppStateManager? appStateManager;
  final ProfileManager? profileManager;
  AppRoute(this.appStateManager, this.profileManager);

  late final routes = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: appStateManager,
    initialLocation: '/splash',
    routes: [
      GoRoute(
          name: 'splash',
          path: '/splash',
          builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name : 'home',
        path: '/:tab',
        builder: (context, state){
          final tab = int.tryParse(state.params['tab'] ?? '')??0;
          return Home(
            key: state.pageKey,
            currentTab : tab,
          );
        }
      ),
    ],
  );
}