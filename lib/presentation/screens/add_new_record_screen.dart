import 'package:expense_tracker/data/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class AddNewRecordScreen extends StatefulWidget {
  const AddNewRecordScreen({Key? key}) : super(key: key);

  @override
  State<AddNewRecordScreen> createState() => _AddNewRecordScreenState();
}

class _AddNewRecordScreenState extends State<AddNewRecordScreen> {
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
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5),
                child: Text(
                  "Add New Entry",
                  style: TextStyle(
                      color: kPrimaryGreen,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5),
                child: Text(
                  "Select Category",
                  style: TextStyle(
                      color: kDarkGray,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Flexible(
                child: GridView.count(
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  children: [
                    // Container(
                    //   margin: EdgeInsets.symmetric(horizontal: 2),
                    //   decoration: BoxDecoration(
                    //     color: Colors.amber,
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Icon(
                    //         Boxicons.bx_smile,
                    //         size: 32,
                    //       ),
                          
                    //       SizedBox(
                    //           width: 60,
                    //           child: Text(
                    //             "Entertainment",
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(fontSize: 12),
                    //             softWrap: true,
                    //           ))
                    //     ],
                    //   ),
                    // ),
                 
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: kPrimaryGreen,
                  initialValue: '',
                  maxLength: 50,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryGreen),
                    ),
                    focusColor: kPrimaryGreen,
                    // icon: Icon(Icons.favorite),
                    labelText: 'Transaction Title',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: kLightGray,
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kLightGray),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: kPrimaryGreen,
                  initialValue: '',
                  keyboardType: TextInputType.number,
                  // maxLength: 12,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryGreen),
                    ),
                    focusColor: kPrimaryGreen,
                    // icon: Icon(Icons.favorite),
                    labelText: 'Amount',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      color: kLightGray,
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kLightGray),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
