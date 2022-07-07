import 'package:flutter/material.dart';

import '../../data/colors.dart';

class HomeTopbar extends StatelessWidget {
  const HomeTopbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Good Morning",
                style: TextStyle(
                  fontSize: 14,
                  color: kDarkGray,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Shif A",
                style: TextStyle(
                  fontSize: 20,
                  color: kPrimaryGreen,
                ),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.settings,
          color: kDarkGray,
        )
      ],
    );
  }
}
