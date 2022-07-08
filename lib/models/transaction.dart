class Transaction {
  final TransactionCategory transactionCategory;
  final String description;
  // final Icons icon;
  final String amount;
  final DateTime dateTime;

  Transaction(
      {required this.transactionCategory,
      required this.description,
      // required this.icon,
      required this.amount,
      required this.dateTime});
}

enum TransactionCategory {
  income,
  housing,
  fooddrink,
  entertainment,
  utilities,
  transport,
  shopping,
  investment,
  miscellaneous,
}
