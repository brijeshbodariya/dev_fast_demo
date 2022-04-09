import 'package:dev_fast_demo/constant/constant.dart';
import 'package:dev_fast_demo/notifiers/dark_theme_provider.dart';
import 'package:dev_fast_demo/ui/screens/agenda_screen.dart';
import 'package:dev_fast_demo/ui/screens/home_screen.dart';
import 'package:dev_fast_demo/ui/screens/speaker_list.dart';
import 'package:dev_fast_demo/ui/screens/speakers.dart';
import 'package:dev_fast_demo/ui/screens/splashscreen.dart';
import 'package:dev_fast_demo/ui/screens/sponsors.dart';
import 'package:dev_fast_demo/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.devFestPreferences.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        }),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext? context, value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context!),
            home: const SplashScreen(),
            routes: <String, WidgetBuilder>{
              agenda: (BuildContext context) => const AgendaScreen(),
              homeScreen: (BuildContext context) => const HomeScreen(),
              speaker: (BuildContext context) => const SpeakerDetailsScreen(),
              speakerList: (BuildContext context) => const SpeakersScreenList(),
              sponsers: (BuildContext context) => const Sponsors(),
              team: (BuildContext context) => const SpeakersScreenList(),
            },
          );
        },
      ),
    );
  }
}
