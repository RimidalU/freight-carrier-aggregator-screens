import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/views/views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ЛАИМ',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily:
            GoogleFonts.inter(color: const Color(0xff000000)).fontFamily,
      ),
      home: const ClientInfoScreen(),
    );
  }
}
