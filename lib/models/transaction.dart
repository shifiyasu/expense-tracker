class Statement {
  final StatementCategory statementCategory;
  final String description;
  // final Icons icon;
  final String amount;
  final DateTime dateTime;

  Statement(
      {required this.statementCategory,
      required this.description,
      // required this.icon,
      required this.amount,
      required this.dateTime});
}

enum StatementCategory {
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
