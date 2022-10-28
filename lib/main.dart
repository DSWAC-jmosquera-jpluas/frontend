import 'package:citasmedicas/navigation/routes.dart';
import 'package:citasmedicas/navigation/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          //#6d91c7 this color as primary color
          primarySwatch: const MaterialColor(0xFF6D91C7, {
            50: Color(0xFFE8EAF6),
            100: Color(0xFFC5CAE9),
            200: Color(0xFF9FA8DA),
            300: Color(0xFF7986CB),
            400: Color(0xFF5C6BC0),
            500: Color(0xFF3F51B5),
            600: Color(0xFF3949AB),
            700: Color(0xFF303F9F),
            800: Color(0xFF283593),
            900: Color(0xFF1A237E),
          }),
          primaryColor: const Color(0xFF1A237E),
          secondaryHeaderColor: const MaterialColor(0xFF6D91C7, {
            50: Color(0xFFE8EAF6),
            100: Color(0xFFC5CAE9),
            200: Color(0xFF9FA8DA),
            300: Color(0xFF7986CB),
            400: Color(0xFF5C6BC0),
            500: Color(0xFF3F51B5),
            600: Color(0xFF3949AB),
            700: Color(0xFF303F9F),
            800: Color(0xFF283593),
            900: Color(0xFF1A237E),
          }),
          inputDecorationTheme: InputDecorationTheme(
            //cool border
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  color: Color(
                    0xFF1A237E,
                  ),
                  width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF1A237E)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF1A237E)),
            ),
          ),
        ),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        initialRoute: RouteNames.homePage);
  }
}
