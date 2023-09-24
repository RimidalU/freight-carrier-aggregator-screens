import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/order_info_screen_data.dart';

class OrderInfoScreen extends StatelessWidget {
  const OrderInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff363936),
        title: Text(
          'Название заказа',
          style: GoogleFonts.montserrat(
            fontSize: 27,
            color: const Color(0xffFFFFFF),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 46),
                color: const Color(0xff05FF00).withOpacity(0.17),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                child: const AuctionInfo(
                  auctionInfo: auctionInfo,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                margin: const EdgeInsets.only(top: 18),
                color: const Color(0xff05FF00).withOpacity(0.17),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                child: const OrderInfo(
                  auctionInfo: auctionInfo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getRowInfo({
  required String title,
  required String titleDescription,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      Text(
        titleDescription.isEmpty ? 'не добавленo' : titleDescription.toString(),
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    ],
  );
}

class AuctionInfo extends StatelessWidget {
  const AuctionInfo({
    super.key,
    required this.auctionInfo,
    this.onTap,
  });

  final VoidCallback? onTap;
  final Map<String, Object> auctionInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: const Text(
            'Аукцион',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 23,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        getRowInfo(
          title: 'Начальная стоимость: ',
          titleDescription: auctionInfo['price'] != null
              ? auctionInfo['price'].toString()
              : '0',
        ),
        const SizedBox(
          height: 11,
        ),
        getRowInfo(
          title: 'Лучшее предложение: ',
          titleDescription: auctionInfo['bestPrice'] != null
              ? auctionInfo['bestPrice'].toString()
              : '0',
        ),
        const SizedBox(
          height: 11,
        ),
        getRowInfo(
          title: 'Ваше предложение: ',
          titleDescription: auctionInfo['yourPrice'] != null
              ? auctionInfo['yourPrice'].toString()
              : '0',
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: onTap ?? () {},
          child: Container(
            alignment: Alignment.center,
            child: Text(
              'Изменить предложение',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OrderInfo extends StatelessWidget {
  const OrderInfo({
    super.key,
    required this.auctionInfo,
    this.onTap,
  });

  final VoidCallback? onTap;
  final Map<String, Object> auctionInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: const Text(
            'О заказе:',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 23,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        getRowInfo(
          title: 'Начальная стоимость: ',
          titleDescription: auctionInfo['price'] != null
              ? auctionInfo['price'].toString()
              : '0',
        ),
        const SizedBox(
          height: 11,
        ),
        getRowInfo(
          title: 'Лучшее предложение: ',
          titleDescription: auctionInfo['bestPrice'] != null
              ? auctionInfo['bestPrice'].toString()
              : '0',
        ),
        const SizedBox(
          height: 11,
        ),
        getRowInfo(
          title: 'Ваше предложение: ',
          titleDescription: auctionInfo['yourPrice'] != null
              ? auctionInfo['yourPrice'].toString()
              : '0',
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: onTap ?? () {},
          child: Container(
            alignment: Alignment.center,
            child: Text(
              'Изменить предложение',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
