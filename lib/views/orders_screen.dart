import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../data/data.dart';
import '../models/order_screen_models.dart';
import '../ui/widgets/widgets.dart';

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
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text(
                    'Санкт-Петербург',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 27,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(
                    'Район',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 23,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20),
                  child: const SizedBox(
                    width: 220,
                    child: Text(
                      'Заказы в выбранных районах:',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 650,
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
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: const Color(0xff05FF00).withOpacity(0.2),
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
  OrderItem({
    super.key,
    required this.order,
    this.onTap,
  });

  final Order order;
  final VoidCallback? onTap;
  final format = NumberFormat("#,##0.00", "ru_RU");

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff05FF00).withOpacity(0.2),
      ),
      margin: const EdgeInsets.only(
        top: 15,
        left: 10,
        right: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              order.name,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
          const SizedBox(height: 10),
          InfoRow(
            title: 'Срок до: ',
            titleDescription: DateFormat('dd.MM.y').format(
              order.finishDate,
            ),
          ),
          const SizedBox(height: 5),
          InfoRow(
            title: 'Предлагаемая цена: ',
            titleDescription: format.format(order.price).toString(),
          ),
          const SizedBox(height: 5),
          InfoRow(
            title: 'Аукцион: ',
            titleDescription: order.isAuction ? 'да' : 'нет',
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: onTap ?? () {},
            borderRadius: BorderRadius.circular(10),
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                'Подробнее',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
