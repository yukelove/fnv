import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/pages/home_page.dart';
import 'package:zw_/router/router_manager.dart';
import 'package:zw_/generated/l10n.dart';

class MyAppPage extends StatelessWidget {
  const MyAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init();
    return MaterialApp(
        locale: const Locale('zh'),
        supportedLocales: const [
          Locale('en', 'US'), // English
          Locale('zh', 'CH'), // Chinese
        ],
        localizationsDelegates: const [
          // ... app-specific localization delegate[s] here
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterManager.router.generator,
      home: HomePage(),
    );
  }
}