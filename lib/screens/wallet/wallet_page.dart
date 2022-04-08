import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  final String userID;
  const WalletScreen(this.userID,{Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.027,
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.3),
              ),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Text(
                "Total Amount : Rs.100",
                style: TextStyle(fontSize: 26),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.027,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
            width: MediaQuery.of(context).size.width*0.4,
            child: RaisedButton(
              onPressed: (){
              },
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: const Text("Withdraw",
                style: TextStyle(color: Colors.white,fontSize: 24),
              ),
              // style: ElevatedButton.styleFrom(
              //   primary: Colors.red,
              //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //     textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              //     shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(30.0),
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
