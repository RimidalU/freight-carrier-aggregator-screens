final Map<String, Object> clientInfoFull = {
  'id': "id1",
  'name': 'ПИК',
  'kindActivity': 'Продажа песка',
  'rating': 96,
  'registeredAt': DateTime.now().subtract(const Duration(days: 50)),
  'isVerified': true,
};

final Map<String, Object> orderFinishedInfo = {
  'id': "id1",
  'name': 'Перевозка щебеня',
  'finishedIn': DateTime.now().subtract(const Duration(days: 37)),
  'totalPrice': 3250000,
  'isAuction': true,
};
