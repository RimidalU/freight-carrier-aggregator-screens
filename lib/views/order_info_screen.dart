import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../data/order_info_screen_data.dart';
import '../ui/widgets/widgets.dart';

class OrderInfoScreen extends StatelessWidget {
  const OrderInfoScreen({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff363936),
        title: const Text(
          'Название заказа',
          style: TextStyle(
            fontSize: 27,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff05FF00).withOpacity(0.2),
                ),
                margin: const EdgeInsets.only(
                  top: 30,
                  left: 10,
                  right: 10,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: AuctionInfo(
                  auctionInfo: auctionInfo,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff05FF00).withOpacity(0.2),
                ),
                margin: const EdgeInsets.only(
                  top: 30,
                  left: 10,
                  right: 10,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: OrderInfo(
                  orderInfo: orderInfo,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff05FF00).withOpacity(0.2),
                ),
                margin: const EdgeInsets.only(
                  top: 30,
                  left: 10,
                  right: 10,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: ClientInfoShort(
                  clientInfoShort: clientInfoShort,
                ),
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: onTap ?? () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color(0xff05FF00).withOpacity(0.2)),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
                ),
                child: const Text(
                  'Отклинуться',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xff000000),
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
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
  AuctionInfo({
    super.key,
    required this.auctionInfo,
    this.onTap,
  });

  final VoidCallback? onTap;
  final Map<String, Object> auctionInfo;
  final format = NumberFormat("#,##0.00", "ru_RU");

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(height: 10),
        InfoRow(
          title: 'Начальная стоимость: ',
          titleDescription: auctionInfo['price'] != null
              ? format.format(auctionInfo['price'])
              : '0',
        ),
        const SizedBox(height: 5),
        InfoRow(
          title: 'Лучшее предложение: ',
          titleDescription: auctionInfo['bestPrice'] != null
              ? format.format(auctionInfo['bestPrice'])
              : '0',
        ),
        const SizedBox(height: 5),
        InfoRow(
          title: 'Ваше предложение: ',
          titleDescription: auctionInfo['yourPrice'] != null
              ? format.format(auctionInfo['yourPrice'])
              : '0',
        ),
        const SizedBox(height: 5),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: onTap ?? () {},
          borderRadius: BorderRadius.circular(10),
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              'Изменить предложение',
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
    );
  }
}

class OrderInfo extends StatelessWidget {
  const OrderInfo({
    super.key,
    required this.orderInfo,
  });

  final Map<String, Object> orderInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: const Text(
            'О заказе',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 23,
            ),
          ),
        ),
        const SizedBox(height: 10),
        InfoRow(
          title: 'Тип груза: ',
          titleDescription: orderInfo['cargoType'] != null
              ? orderInfo['cargoType'].toString()
              : '',
        ),
        const SizedBox(height: 5),
        InfoRow(
          title: 'Общая масса груза, тонн: ',
          titleDescription: orderInfo['totalCargoWeight'] != null
              ? orderInfo['totalCargoWeight'].toString()
              : '',
        ),
        const SizedBox(height: 5),
        InfoRow(
          title: 'Общих объём груза, m3: ',
          titleDescription: orderInfo['totalCargoVolume'] != null
              ? orderInfo['totalCargoVolume'].toString()
              : '',
        ),
        const SizedBox(height: 5),
        InfoRow(
          title: 'Срок исполнения: ',
          titleDescription: orderInfo['deadline'] != null
              ? DateFormat('dd.MM.y').format(
                  orderInfo['deadline'] as DateTime,
                )
              : '',
        ),
        const SizedBox(height: 5),
        InfoRow(
          title: 'Расстояние, км: ',
          titleDescription: orderInfo['distance'] != null
              ? orderInfo['distance'].toString()
              : '',
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class ClientInfoShort extends StatelessWidget {
  const ClientInfoShort({
    super.key,
    required this.clientInfoShort,
    this.onTap,
  });

  final VoidCallback? onTap;
  final Map<String, Object> clientInfoShort;

  String getRating(String rating) {
    return '$rating/100';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: const Text(
            'О заказчике:',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 23,
            ),
          ),
        ),
        const SizedBox(height: 10),
        InfoRow(
          title: 'Рейтинг: ',
          titleDescription: clientInfoShort['rating'] != null
              ? getRating(clientInfoShort['rating'].toString())
              : '',
        ),
        const SizedBox(height: 5),
        InfoRow(
          title: 'Заказов на площадке: ',
          titleDescription: clientInfoShort['totalOrders'] != null
              ? clientInfoShort['totalOrders'].toString()
              : 'Заказов нет',
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: onTap ?? () {},
          borderRadius: BorderRadius.circular(10),
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              'Профиль заказчика',
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
    );
  }
}
