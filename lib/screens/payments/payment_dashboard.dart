import 'package:flutter/material.dart';
import 'package:ngo/main.dart';
import 'package:ngo/screens/farmers/fruitAdded.dart';
import 'package:ngo/screens/farmers/vegetableAdded.dart';
import 'package:ngo/screens/payments/card_details.dart';
import 'package:ngo/screens/payments/upi_details.dart';

class PaymentDashboard extends StatefulWidget {
  final String UserID;
  const PaymentDashboard({Key? key,required this.UserID}) : super(key: key);

  @override
  State<PaymentDashboard> createState() => _PaymentDashboardState();
}

class _PaymentDashboardState extends State<PaymentDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Options"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.027,
          ),
          Center(
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UPIDetails(userID: widget.UserID)),
                );
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.3),
                ),
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Text(
                  "UPI",
                  style: TextStyle(fontSize: 26),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.027,
          ),
          Center(
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentDetails(userID: widget.UserID)),
                );
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.3),
                ),
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.9,
                child: const Text(
                  "Card",
                  style: TextStyle(fontSize: 26),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
