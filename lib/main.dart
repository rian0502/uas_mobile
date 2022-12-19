
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unila_data/api/api_unila.dart';
import 'thema.dart';
import 'models/models.dart';
import 'navigation/app_router.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiUnila.getBukuAjar(1).then((value) => print(value.data![0].judulBuku));
  final appStateManager = AppStateManager();
  await appStateManager.initializeApp();
  runApp(UnilaData(appStateManager: appStateManager));
}

class UnilaData extends StatefulWidget {
  final AppStateManager appStateManager;

  const UnilaData({
    Key? key,
    required this.appStateManager,
  });

  @override
  UnilaDataState createState() => UnilaDataState();
}

class UnilaDataState extends State<UnilaData> {
  late final _groceryManager = GroceryManager();
  late final _profileManager = ProfileManager();
  late final _appRouter = AppRouter(
    widget.appStateManager,
    _profileManager,
    _groceryManager,
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _groceryManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        ),
        ChangeNotifierProvider(
          create: (context) => widget.appStateManager,
        ),
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = Thema.dark();
          } else {
            theme = Thema.light();
          }

          final router = _appRouter.router;

          return MaterialApp.router(
            theme: theme,
            title: 'One Data Unila',
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
          );
        },
      ),
    );
  }
}




