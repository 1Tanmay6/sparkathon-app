import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

import 'screens/auth_Screen.dart';
import 'screens/bottomNavBar_Screen.dart';
import 'providers/auth_provider.dart';
import '/providers/content_provider.dart';
import 'screens/chat_home_screen.dart';
import 'widgets/chat_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthServices>(
          create: (context) => AuthServices(),
        ),
        ChangeNotifierProvider<ContentProvider>(
          create: (context) => ContentProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Quantum',

        theme: ThemeData(
            colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Color(0xFF1c1c1e),
              onPrimary: Color(0xFFf5f5f5),
              secondary: Color(0xFF65D2E9), // Cyan
              onSecondary: Color(0xFFf5f5f5),
              error: Color.fromARGB(255, 224, 17, 17), // Red for error
              onError: Colors.black,
              background: Color(0xFF1c1c1e),
              onBackground: Color(0xFFf5f5f5),
              surface: Color(0xFFE6436D), // Red surface
              onSurface: Colors.black,
            ),
            useMaterial3: true,
            textTheme: TextTheme(
              displayLarge: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: MediaQuery.of(context).size.height * 0.035,
                fontWeight: FontWeight.w600,
              ),
              bodySmall: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: MediaQuery.of(context).size.height * 0.015,
                fontWeight: FontWeight.normal,
              ),
              bodyMedium: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: MediaQuery.of(context).size.height * 0.015,
                fontWeight: FontWeight.normal,
              ),
            )).copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        // darkTheme: ThemeData(
        //   colorScheme: const ColorScheme(
        //     brightness: Brightness.light,
        //     primary: Color(0xFFf5f5f5),
        //     onPrimary: Color(0xFF000000),
        //     secondary: Color(0xFF65D2E9), // Cyan
        //     onSecondary: Color(0xFFf5f5f5),
        //     error: Color(0xFFE6436D), // Red for error
        //     onError: Colors.black,
        //     background: Color(0xFFFFFFFF), // White background
        //     onBackground: Color(0xFF0C4160),
        //     surface: Color(0xFFE6436D), // Red surface
        //     onSurface: Colors.black,
        //   ),
        //   useMaterial3: true,
        //   textTheme: TextTheme(
        //     displayLarge: TextStyle(
        //       fontFamily: 'Montserrat',
        //       fontSize: MediaQuery.of(context).size.height * 0.035,
        //       fontWeight: FontWeight.w600,
        //     ),
        //     bodySmall: TextStyle(
        //       fontFamily: 'Montserrat',
        //       fontSize: MediaQuery.of(context).size.height * 0.015,
        //       fontWeight: FontWeight.normal,
        //     ),
        //     bodyMedium: TextStyle(
        //       fontFamily: 'Montserrat',
        //       fontSize: MediaQuery.of(context).size.height * 0.015,
        //       fontWeight: FontWeight.normal,
        //     ),
        //   ),
        //   pageTransitionsTheme: const PageTransitionsTheme(
        //     builders: <TargetPlatform, PageTransitionsBuilder>{
        //       TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        //     },
        //   ),
        // ),
        home: const AuthScreen(),
      ),
    );
  }
}
