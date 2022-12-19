import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zw_/api/api.dart';
import 'package:zw_/config/screen_util.dart';
import 'package:zw_/networking/networking_manager.dart';
import 'package:zw_/pages/home_page.dart';
import 'package:zw_/router/router_manager.dart';
import 'package:zw_/generated/l10n.dart';

class MyAppPage extends StatelessWidget {
  const MyAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NetworkingManager.init(
        baseUrl: Api.BASE_URL,
        connectTimeout: NetworkingManager.CONNECT_TIMEOUT,
        receiveTimeout: NetworkingManager.RECEIVE_TIMEOUT);
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
      theme: ThemeData(scaffoldBackgroundColor: Colors.grey[200]),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterManager.router.generator,
      home: HomePage(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: BotToastInit()(context, child),
        );
      },
      navigatorObservers: [BotToastNavigatorObserver(),],
    );
  }
}
