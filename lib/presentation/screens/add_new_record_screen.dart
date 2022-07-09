import 'package:expense_tracker/data/colors.dart';
import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class AddNewRecordScreen extends StatefulWidget {
  const AddNewRecordScreen({Key? key}) : super(key: key);

  @override
  State<AddNewRecordScreen> createState() => _AddNewRecordScreenState();
}

class _AddNewRecordScreenState extends State<AddNewRecordScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isExpense = true;
  String? _dropdownValue;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _amountFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [kPrimaryGreen, kWhite],
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.8),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Add_Record_Shapes.png"),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Form(
              key: _formKey,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          0.0,
                          6.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      //BoxShadow
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title on top
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20.0, horizontal: 5),
                        child: Center(
                          child: Text(
                            "Add New Entry",
                            style: TextStyle(
                                color: kPrimaryGreen,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),

                      //tab for expense and income
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpense = true;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: isExpense
                                      ? const Border(
                                          bottom: BorderSide(
                                              width: 1.0, color: kPrimaryGreen),
                                        )
                                      : const Border(),
                                  // color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    "Expense",
                                    style: isExpense
                                        ? const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: kPrimaryGreen)
                                        : const TextStyle(
                                            fontSize: 16, color: kLightGray),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpense = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: !isExpense
                                      ? const Border(
                                          bottom: BorderSide(
                                              width: 1.0, color: kPrimaryGreen),
                                        )
                                      : const Border(),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text(
                                    "Income",
                                    style: !isExpense
                                        ? const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: kPrimaryGreen)
                                        : const TextStyle(
                                            fontSize: 16, color: kLightGray),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //drop down for category selection
                      isExpense
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: DropdownButtonFormField<String>(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Select the Expense Category';
                                    }
                                    return null;
                                  },
                                  focusColor: kPrimaryGreen,
                                  value: _dropdownValue,
                                  icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined),
                                  elevation: 16,
                                  dropdownColor: kWhite,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: kDarkGray,
                                  ),
                                  // style: const TextStyle(color: Colors.deepPurple),
                                  decoration: InputDecoration(
                                    // focusedBorder: InputBorder(),
                                    focusColor: kPrimaryGreen,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    // focusedBorder: UnderlineInputBorder(
                                    //   borderSide: BorderSide(color: kPrimaryGreen),
                                    // ),
                                  ),
                                  hint: Row(
                                    children: const [
                                      Icon(
                                        Boxicons.bx_slider_alt,
                                        color: kDarkGray,
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        "Select a Category",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: kLightGray,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _dropdownValue = newValue!;
                                    });
                                    _titleFocusNode.requestFocus();
                                  },
                                  items: [
                                    'Food & Drink',
                                    'Housing',
                                    'Transport',
                                    'Utilities',
                                    'Shopping',
                                    'Entertainment',
                                    'Investment',
                                    'Miscellaneous'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          : Container(),

                      //transaction form field
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          focusNode: _titleFocusNode,
                          textInputAction: TextInputAction.next,
                          controller: _titleController,
                          onFieldSubmitted: (String value) {
                            _amountFocusNode.requestFocus();
                            print(value);
                          },
                          cursorColor: kPrimaryGreen,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a title';
                            }
                            return null;
                          },
                          // maxLength: 50,
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

                      //amount form field
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          focusNode: _amountFocusNode,
                          controller: _amountController,
                          cursorColor: kPrimaryGreen,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a value';
                            } else if (double.tryParse(value) == null) {
                              return 'Please enter a number';
                            }
                            return null;
                          },
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

                      // save button
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 10),
                        child: SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kPrimaryGreen)),
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                // print(_titleController.text);
                                // print(double.parse(_amountController.text));
                                // print(_dropdownValue);
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(
                                //       content: Text('Processing Data')),
                                // );
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.0),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: kWhite,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
