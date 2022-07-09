import 'package:expense_tracker/cubit/statement_cubit.dart';
import 'package:expense_tracker/data/colors.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/presentation/widgets/home_monthly_spending_card.dart';
import 'package:expense_tracker/presentation/widgets/home_single_record_tile.dart';
import 'package:expense_tracker/presentation/widgets/home_topbar.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Statement> transactions = [
    Statement(
      statementCategory: StatementCategory.fooddrink,
      description: "Movie Night",
      amount: "498",
      dateTime: DateTime.now(),
    ),
    Statement(
      statementCategory: StatementCategory.investment,
      description: "Cyrpto Purchase",
      amount: "2500",
      dateTime: DateTime.now(),
    ),
  ];

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //topbar for greeting and setting
                const HomeTopbar(),
                //home monthly card
                const HomeMonthlySpendingCard(),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5),
                  child: Text(
                    "Recent Records",
                    style: TextStyle(
                        color: kDarkGray,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                BlocBuilder<StatementCubit, StatementState>(
                  builder: (context, statementState) {
                    if (statementState is StatementLoaded) {
                      return Flexible(
                        child: ListView.builder(
                          itemCount: statementState.statements.length,
                          itemBuilder: (BuildContext context, int index) {
                            return HomeSingleRecordTile(
                                statement: statementState.statements[index]);
                          },
                        ),
                      );
                    }else{
                    return Container();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
