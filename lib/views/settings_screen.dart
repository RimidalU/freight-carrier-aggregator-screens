import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/data.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff363936),
        title: Text(
          'Настройки',
          style: GoogleFonts.montserrat(
            fontSize: 27,
            color: const Color(0xffFFFFFF),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 33),
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 9),
            color: const Color(0xff05FF00).withOpacity(0.17),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text(
                    'Настройки профиля',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                    ),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  child: UserInfo(
                    userInfo: userInfo,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.userInfo,
    this.onTap,
  });

  final VoidCallback? onTap;
  final Map<String, Object> userInfo;

  Widget getRowInfo({
    required String title,
    required String titleDescription,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Text(
          titleDescription.isEmpty
              ? 'не добавленo'
              : titleDescription.toString(),
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  String formattedPhoneNumber(String phoneNumber) {
    return "${phoneNumber.substring(0, phoneNumber.length - 10)} ${phoneNumber.substring(phoneNumber.length - 10, phoneNumber.length - 7)} ${phoneNumber.substring(phoneNumber.length - 7, phoneNumber.length - 4)} ${phoneNumber.substring(phoneNumber.length - 4, phoneNumber.length - 2)} ${phoneNumber.substring(phoneNumber.length - 2, phoneNumber.length)}";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        getRowInfo(
          title: 'ФИО: ',
          titleDescription: userInfo['name'].toString(),
        ),
        const SizedBox(
          height: 2,
        ),
        getRowInfo(
          title: 'Почта: ',
          titleDescription:
              userInfo['email'] != null ? userInfo['email'].toString() : '',
        ),
        const SizedBox(
          height: 2,
        ),
        getRowInfo(
          title: 'Номер телефона: ',
          titleDescription: userInfo['phoneNumber'] != null
              ? formattedPhoneNumber(userInfo['phoneNumber'].toString())
              : '',
        ),
        const SizedBox(
          height: 2,
        ),
        InkWell(
          onTap: onTap ?? () {},
          child: Container(
            child: Text(
              'Изменить пароль',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          userInfo['description'] as String,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
