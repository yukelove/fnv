import 'package:flutter/material.dart';
import 'package:zw_/pages/home_page.dart';
import 'package:zw_/router/router_manager.dart';

class MyAppPage extends StatelessWidget {
  const MyAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterManager.router.generator,
      home: HomePage(),
    );
  }
}

// class AppPage extends StatelessWidget {
//   const AppPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       onGenerateRoute: RouterManager.router.generator,
//       home: HomePage(),
//     );
//   }
// }

// class AppPage extends StatefulWidget {
//   const AppPage({Key? key}) : super(key: key);

//   @override
//   State<AppPage> createState() => _AppPageState();
// }

// class _AppPageState extends State<AppPage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       onGenerateRoute: RouterManager.router.generator,
//       home: HomePage(),
//     );
//   }
// }