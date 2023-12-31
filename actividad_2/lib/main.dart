import 'package:actividad_2/screens/home_page.dart';
import 'package:actividad_2/styles/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            elevation: 4,
            backgroundColor: AppStyles.persianPink,
            foregroundColor: Colors.white,
            centerTitle: true,
          )),
      home: const HomePage(),
    );
  }
}
