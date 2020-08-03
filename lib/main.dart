import 'package:da_ngon_ngu/localization/demo_localization.dart';
import 'package:da_ngon_ngu/routes/custome_router.dart';
import 'package:da_ngon_ngu/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo đa ngôn ngữ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: [
        const Locale('vi', 'VN'),
        const Locale('en', 'US'),
        const Locale('ko', 'KR'),
        const Locale('ja', 'JP'),
      ],
      locale: _locale,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        DemoLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale.languageCode) {
            return deviceLocale;
          }
          return deviceLocale;
        }
      },
      debugShowCheckedModeBanner: false,
      onGenerateRoute: CustomRouter.allRoutes,
      initialRoute: homeRoute,
    );
  }
}
