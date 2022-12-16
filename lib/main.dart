import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unila_data/models/ProfileManager.dart';
import 'package:unila_data/thema.dart';
import 'api/api.dart';
import 'models/app_state_manager.dart';
import 'navigation/app_route.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appStateManager = AppStateManager();
  final pref = await SharedPreferences.getInstance();
  ServiceAPI.getLoginAccess().then((value) => {
    pref.setString('token', 'bearer${value.data!.token}')
  });
  runApp(MyApp(appStateManager: appStateManager,));

}
class MyApp extends StatefulWidget {
  final AppStateManager appStateManager;
  const MyApp({
    Key? key,
    required this.appStateManager,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final _profileManager = ProfileManager();
  late final _appRouter = AppRoute(
    widget.appStateManager,
    _profileManager
  );
  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => widget.appStateManager),
      ChangeNotifierProvider(create: (context) => _profileManager),
    ],
    child: Consumer<ProfileManager>(
      builder: (context, profileManager, child) {
        ThemeData theme;
        if (profileManager.darkMode) {
          theme = Thema.dark();
        } else {
          theme = Thema.light();
        }
        final router = _appRouter.routes;
        return MaterialApp.router(
          title: 'One Data Unila',
          theme: theme,
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
        );
      },
    ),
    );
  }
}




