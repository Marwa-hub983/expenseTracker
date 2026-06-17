
import 'package:expense_trackerapp/shared/routes/route_generator.dart';
import 'package:expense_trackerapp/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GoRouter router = RouteGenerator.generateRoute();
  // ThemeMode _themeMode = ThemeMode.light;
  // void toggleTheme() {
  //   setState(() {
  //     _themeMode = _themeMode == ThemeMode.light
  //         ? ThemeMode.dark
  //         : ThemeMode.light;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'ExpenseTracker App',
      theme: AppTheme.darkTheme,
   


      routerConfig: router,
    );
  }
}
