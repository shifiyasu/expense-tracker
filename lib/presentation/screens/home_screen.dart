import 'dart:ui';

import 'package:expense_tracker/data/colors.dart';
import 'package:expense_tracker/presentation/widgets/home_monthly_spending_card.dart';
import 'package:expense_tracker/presentation/widgets/home_topbar.dart';
import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [kPrimaryGreen, kWhite],
          ),
        ),
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(255, 255, 255, 0.8),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                //topbar for greeting and setting
                HomeTopbar(),
                //home monthly card
                HomeMonthlySpendingCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
