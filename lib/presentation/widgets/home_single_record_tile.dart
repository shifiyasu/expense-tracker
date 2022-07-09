import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../data/colors.dart';
import '../../models/transaction.dart';

class HomeSingleRecordTile extends StatelessWidget {
  final Statement statement;
  const HomeSingleRecordTile({Key? key, required this.statement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(statement.dateTime);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Card(
        color: kWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        borderOnForeground: false,
        elevation: .5,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          iconColor: kPrimaryGreen,
          tileColor: kWhite,
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              statement.statementCategory == StatementCategory.income
                  ? Text(
                      "+\$${statement.amount}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: kPrimaryGreen),
                    )
                  : Text(
                      "-\$${statement.amount}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.red),
                    ),
            ],
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedDate,
                  style: const TextStyle(fontSize: 12, color: kLightGray),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    statement.description,
                    style: const TextStyle(
                        color: kTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  statement.statementCategory.toString().split(".")[1],
                  style: const TextStyle(fontSize: 12, color: kPrimaryGreen),
                )
              ],
            ),
          ),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              statement.statementCategory == StatementCategory.entertainment
                  ? const Icon(Boxicons.bx_cool)
                  : statement.statementCategory == StatementCategory.fooddrink
                      ? const Icon(Boxicons.bx_cookie)
                      : statement.statementCategory == StatementCategory.housing
                          ? const Icon(Boxicons.bx_building_house)
                          : statement.statementCategory ==
                                  StatementCategory.income
                              ? const Icon(Boxicons.bx_arrow_to_top)
                              : statement.statementCategory ==
                                      StatementCategory.investment
                                  ? const Icon(Boxicons.bx_trending_up)
                                  : statement.statementCategory ==
                                          StatementCategory.utilities
                                      ? const Icon(Boxicons.bx_wrench)
                                      : statement.statementCategory ==
                                              StatementCategory.shopping
                                          ? const Icon(Boxicons.bx_shopping_bag)
                                          : statement.statementCategory ==
                                                  StatementCategory.transport
                                              ? const Icon(Boxicons.bx_car)
                                              : const Icon(Boxicons.bx_ghost),
            ],
          ),
        ),
      ),
    );
  }
}
