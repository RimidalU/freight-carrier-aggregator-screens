import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../data/data.dart';
import '../models/order_screen_models.dart';

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
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text(
                    'Санкт-Петербург',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 14),
                  child: const Text(
                    'Район',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 27,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                SizedBox(
                  height: 36,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...districtData
                          .map((district) => District(district: district))
                          .toList()
                    ],
                  ),
                ),
                const SizedBox(height: 76),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  child: const SizedBox(
                    width: 214,
                    child: Text(
                      'Заказы в выбранных районах',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 47,
                ),
                Container(
                  width: double.infinity,
                  height: 600,
                  padding: const EdgeInsets.all(15),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return OrderItem(order: orders[index]);
                    },
                    itemCount: orders.length,
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

class District extends StatelessWidget {
  const District({super.key, required this.district, this.onTap});

  final String district;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: const Color(0xff05FF00).withOpacity(0.17),
        ),
        child: Text(
          district,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.order,
    this.onTap,
  });

  final Order order;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff05FF00).withOpacity(0.17),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.name,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'до ${DateFormat.yMd().format(order.finishDate)}',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Предлагаемая цена:  ${order.price}',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Аукцион:  ${order.isAuction ? 'да' : 'нет'}",
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'подробнее',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
