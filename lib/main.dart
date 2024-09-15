import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:architecto/config/theme.dart';
import 'package:architecto/providers/auth/provider.dart';
import 'package:architecto/providers/auth/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'config/config.dart';
import 'config/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Config.initialize();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(Architecto(
    themeMode: await AdaptiveTheme.getThemeMode(),
  ));
}

class Architecto extends StatefulWidget {
  final themeMode;

  const Architecto({Key? key, @required this.themeMode}) : super(key: key);

  @override
  State<Architecto> createState() => _ArchitectoState();
}

class _ArchitectoState extends State<Architecto> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: CupertinoAdaptiveTheme(
        debugShowFloatingThemeButton: true,
        light: lightThemeData,
        dark: darkThemeData,
        initial: AdaptiveThemeMode.light,
        builder: (theme) => CupertinoApp(
          debugShowCheckedModeBanner: false,
          title: Config.appName,
          theme: theme,
          home: AuthWrapper(),
        ),
      ),
    );
  }
}
