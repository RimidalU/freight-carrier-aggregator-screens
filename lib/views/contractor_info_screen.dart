import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lime/ui/ui.dart';

import '../data/data.dart';

class ContractorInfoScreen extends StatelessWidget {
  const ContractorInfoScreen({
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
          'Название исполнителя',
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
                child: ContractorInfoShort(
                  contractorInfoFull: contractorInfoFull,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  'Транспорт',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 27,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [...carPark.map((car) => const CarCard()).toList()],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  'Выполненые заказы',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 27,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 390,
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return FinishedOrders(
                        orderFinishedInfo: orderFinishedInfo[index]);
                  },
                  itemCount: orderFinishedInfo.length,
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
                  'Смотреть все выполненые заказы',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xff000000),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  'Отзывы',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 27,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: 390,
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ReviewItem(reviews: reviews[index]);
                  },
                  itemCount: reviews.length,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class ContractorInfoShort extends StatelessWidget {
  const ContractorInfoShort({
    super.key,
    required this.contractorInfoFull,
  });

  final Map<String, Object> contractorInfoFull;

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
          child: Text(
            clientInfoFull['name'].toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 23,
            ),
          ),
        ),
        const SizedBox(height: 10),
        InfoRow(
          title: 'Инд. исп/компания: ',
          titleDescription: contractorInfoFull['contractorType'] != null
              ? contractorInfoFull['contractorType'].toString()
              : '',
        ),
        const SizedBox(height: 5),
        InfoRow(
          title: 'Рейтинг: ',
          titleDescription: contractorInfoFull['rating'] != null
              ? getRating(contractorInfoFull['rating'].toString())
              : '',
        ),
        const SizedBox(height: 5),
        InfoRow(
          title: 'Зарегистрирован: ',
          titleDescription: contractorInfoFull['registeredAt'] != null
              ? DateFormat('dd.MM.y').format(
                  contractorInfoFull['registeredAt'] as DateTime,
                )
              : '',
        ),
        const SizedBox(height: 5),
        InfoRow(
          title: 'Проверенна системой CPM: ',
          titleDescription:
              contractorInfoFull['isVerified'] as bool ? 'Да' : 'Нет',
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class FinishedOrders extends StatelessWidget {
  FinishedOrders({
    super.key,
    required this.orderFinishedInfo,
    this.onTap,
  });

  final Map<String, Object> orderFinishedInfo;
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
              orderFinishedInfo['name'].toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
          const SizedBox(height: 10),
          InfoRow(
            title: 'Заказчик: ',
            titleDescription: orderFinishedInfo['client'] != null
                ? orderFinishedInfo['client'] as String
                : '',
          ),
          const SizedBox(height: 5),
          InfoRow(
            title: 'Конечная цена: ',
            titleDescription: orderFinishedInfo['totalPrice'] != null
                ? format.format(orderFinishedInfo['totalPrice'])
                : '0',
          ),
          const SizedBox(height: 5),
          InfoRow(
            title: 'Сроки: ',
            titleDescription: orderFinishedInfo['finishedIn'] != null
                ? DateFormat('dd.MM.y')
                    .format(orderFinishedInfo['finishedIn'] as DateTime)
                : '',
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

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
    required this.reviews,
    this.onTap,
  });

  final VoidCallback? onTap;
  final Map<String, Object> reviews;

  String getRating(String rating) {
    return '$rating/10';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff05FF00).withOpacity(0.2),
      ),
      margin: const EdgeInsets.only(
        top: 15,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 10),
          InfoRow(
            title: 'Оценка: ',
            titleDescription: reviews['rating'] != null
                ? getRating(reviews['rating'].toString())
                : '',
          ),
          const SizedBox(height: 5),
          InfoRow(
            title: 'Заказчик: ',
            titleDescription:
                reviews['client'] != null ? reviews['client'].toString() : '',
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              reviews['description'] as String,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
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
        ],
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffD9D9D9).withOpacity(0.2),
      ),
      margin: const EdgeInsets.only(
        top: 15,
        left: 10,
        right: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    );
  }
}
