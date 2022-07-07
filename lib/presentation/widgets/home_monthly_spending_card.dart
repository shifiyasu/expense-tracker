import 'package:flutter/material.dart';

import '../../data/colors.dart';

class HomeMonthlySpendingCard extends StatelessWidget {
  const HomeMonthlySpendingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .25,
      // width: 40,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage("assets/images/Front_Card.png"),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "July 2022",
              style: TextStyle(
                  color: kWhite, fontSize: 21, fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.red,
                          size: 13,
                        ),
                        Text(
                          "Total Spent",
                          style: TextStyle(
                            fontSize: 16,
                            color: kWhite,
                          ),
                        )
                      ],
                    ),
                    const Text(
                      "\$13,421",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: kWhite),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.arrow_upward,
                          color: Colors.greenAccent,
                          size: 13,
                        ),
                        Text(
                          "Total Earned",
                          style: TextStyle(
                            fontSize: 16,
                            color: kWhite,
                          ),
                        )
                      ],
                    ),
                    const Text(
                      "\$17,000",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: kWhite),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
