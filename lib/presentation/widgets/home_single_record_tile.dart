import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../data/colors.dart';
import '../../models/transaction.dart';

class HomeSingleRecordTile extends StatelessWidget {
  final Transaction transaction;
  const HomeSingleRecordTile({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('yyyy-MM-dd').format(transaction.dateTime);

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
              transaction.transactionCategory == TransactionCategory.income
                  ? Text(
                      "+\$${transaction.amount}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: kPrimaryGreen),
                    )
                  : Text(
                      "-\$${transaction.amount}",
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
                    transaction.description,
                    style: const TextStyle(
                        color: kTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  transaction.transactionCategory.toString().split(".")[1],
                  style: const TextStyle(fontSize: 12, color: kPrimaryGreen),
                )
              ],
            ),
          ),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              transaction.transactionCategory ==
                      TransactionCategory.entertainment
                  ? const Icon(Boxicons.bx_cool)
                  : transaction.transactionCategory ==
                          TransactionCategory.fooddrink
                      ? const Icon(Boxicons.bx_cookie)
                      : transaction.transactionCategory ==
                              TransactionCategory.housing
                          ? const Icon(Boxicons.bx_building_house)
                          : transaction.transactionCategory ==
                                  TransactionCategory.income
                              ? const Icon(Boxicons.bx_arrow_to_top)
                              
                              : transaction.transactionCategory ==
                                      TransactionCategory.investment
                                  ? const Icon(Boxicons.bx_trending_up)
                                  : transaction.transactionCategory ==
                                          TransactionCategory.utilities
                                      ? const Icon(Boxicons.bx_wrench)
                                      : transaction.transactionCategory ==
                                              TransactionCategory.shopping
                                          ? const Icon(Boxicons.bx_shopping_bag)
                                          : transaction.transactionCategory ==
                                                  TransactionCategory.transport
                                              ? const Icon(Boxicons.bx_car)
                                              : const Icon(Boxicons.bx_ghost),
            ],
          ),
        ),
      ),
    );
  }
}
