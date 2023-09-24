import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/data.dart';
import '../ui/widgets/widgets.dart';

class ClientInfoScreen extends StatelessWidget {
  const ClientInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff05FF00).withOpacity(0.2),
            ),
            margin: const EdgeInsets.only(
              top: 30,
              left: 10,
              right: 10,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ClientInfoFull(
                    clientInfoFull: clientInfoFull,
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

class ClientInfoFull extends StatelessWidget {
  const ClientInfoFull({
    super.key,
    required this.clientInfoFull,
  });

  final Map<String, Object> clientInfoFull;

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
          title: 'Вид деятельности: ',
          titleDescription: clientInfoFull['kindActivity'] != null
              ? clientInfoFull['kindActivity'].toString()
              : '',
        ),
        const SizedBox(height: 5),
        InfoRow(
          title: 'Рейтинг: ',
          titleDescription: clientInfoFull['rating'] != null
              ? getRating(clientInfoFull['rating'].toString())
              : '',
        ),
        const SizedBox(height: 5),
        InfoRow(
          title: 'Зарегистрированна: ',
          titleDescription: clientInfoFull['registeredAt'] != null
              ? DateFormat('dd.MM.y').format(
                  clientInfoFull['registeredAt'] as DateTime,
                )
              : '',
        ),
        const SizedBox(height: 5),
        InfoRow(
          title: 'Проверенна системой CPM: ',
          titleDescription: clientInfoFull['isVerified'] as bool ? 'Да' : 'Нет',
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
