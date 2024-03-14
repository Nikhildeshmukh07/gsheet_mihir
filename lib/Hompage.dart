import 'package:flutter/material.dart';
import 'package:gsheet_mihir/plus_button.dart';
import 'package:gsheet_mihir/top_card.dart';

class Hompage extends StatefulWidget {
  const Hompage({super.key});

  @override
  State<Hompage> createState() => _HompageState();
}

class _HompageState extends State<Hompage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TopNeuCard(
              balance: '20,000',
              income: '100',
              expense: '50',
            ),
            Expanded(
                child: Container(
              // color: Colors.blue[300],
              child: Expanded(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                            color: Colors.grey[200],
                            height: 50,
                            child: Center(child: Text('Transaction'))),
                      ),
                    ],
                  ),
                ),
              ),
            )),
            Plusbutton(),
          ],
        ),
      ),
    );
  }
}
