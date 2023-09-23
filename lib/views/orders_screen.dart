import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff363936),
        title: Text(
          'ЛАИМ',
          style: GoogleFonts.montserrat(
            fontSize: 27,
            fontWeight: FontWeight.w700,
            color: const Color(0xff05FF00),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/envelope.svg",
                semanticsLabel: 'Envelope'),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/cog.svg",
              semanticsLabel: 'Settings',
            ),
          ),
        ],
      ),
      body: const SafeArea(child: Column()),
    );
  }
}

class FF00 {}
