import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gsheet_mihir/google_sheet_api.dart';
import 'package:gsheet_mihir/loading_circle.dart';
import 'package:gsheet_mihir/plus_button.dart';
import 'package:gsheet_mihir/top_card.dart';

import 'Transaction.dart';

class Hompage extends StatefulWidget {
  const Hompage({super.key});

  @override
  State<Hompage> createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
  final _textcontrollerAmount = TextEditingController();
  final _textControllerItem = TextEditingController();
  final _fromkey = GlobalKey<FormState>();
  bool _isIncome = false;

  void _enterTransaction() {
    GoogleSheetAPi.insert(
      _textControllerItem.text,
      _textcontrollerAmount.text,
      _isIncome,
    );
    setState(() {});
  }

  void _newTransaction() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                title: Text('N E W  T R A N S A C T I O N'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Expense'),
                          Switch(
                            value: _isIncome,
                            onChanged: (newValue) {
                              setState(() {
                                _isIncome = newValue;
                              });
                            },
                          ),
                          Text('Income'),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Form(
                              key: _fromkey,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Amount?',
                                ),
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Enter an amount';
                                  }
                                  return null;
                                },
                                controller: _textcontrollerAmount,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'For what?',
                              ),
                              controller: _textControllerItem,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  MaterialButton(
                    color: Colors.grey[600],
                    child:
                        Text('Cancel', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    color: Colors.grey[600],
                    child: Text('Enter', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      if (_fromkey.currentState!.validate()) {
                        _enterTransaction();
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              );
            },
          );
        });
  }

  bool timeHasStarted = false;

  void startLoading() {
    timeHasStarted = true;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (GoogleSheetAPi.loading == false) {
        setState(() {
          timer.cancel();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (GoogleSheetAPi.loading == true && timeHasStarted == false) {
      startLoading();
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TopNeuCard(
              balance: (GoogleSheetAPi.calculateIncome() -
                      GoogleSheetAPi.calculateExpense())
                  .toString(),
              income: GoogleSheetAPi.calculateIncome().toString(),
              expense: GoogleSheetAPi.calculateExpense().toString(),
            ),
            Container(
              child: Expanded(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: GoogleSheetAPi.loading == true
                              ? LoadingCircle()
                              : ListView.builder(
                                  itemCount:
                                      GoogleSheetAPi.currentTransaction.length,
                                  itemBuilder: (context, index) {
                                    return MyTransaction(
                                      money: GoogleSheetAPi
                                          .currentTransaction[index][0],
                                      transactionName: GoogleSheetAPi
                                          .currentTransaction[index][1],
                                      expensOrIncome: GoogleSheetAPi
                                          .currentTransaction[index][2],
                                    );
                                  }))
                    ],
                  ),
                ),
              ),
            ),
            Plusbutton(
              function: _newTransaction,
            ),
          ],
        ),
      ),
    );
  }
}
