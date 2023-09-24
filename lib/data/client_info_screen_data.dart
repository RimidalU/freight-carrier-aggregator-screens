final Map<String, Object> clientInfoFull = {
  'id': "id1",
  'name': 'ПИК',
  'kindActivity': 'Продажа песка',
  'rating': 96,
  'registeredAt': DateTime.now().subtract(const Duration(days: 50)),
  'isVerified': true,
};

final List<Map<String, Object>> orderFinishedInfo = [
  {
    'id': "id1",
    'name': 'Перевозка щебеня',
    'finishedIn': DateTime.now().subtract(const Duration(days: 37)),
    'totalPrice': 3250000,
    'client': 'OOO "МОР"',
    'isAuction': true,
  },
  {
    'id': "id2",
    'name': 'Доставка холодильника',
    'finishedIn': DateTime.now().subtract(const Duration(days: 223)),
    'totalPrice': 32000,
    'client': 'ОПО "ИЛМС"',
    'isAuction': false,
  },
];
