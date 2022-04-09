import 'package:flutter/material.dart';
import 'package:ngo/main.dart';
import 'package:ngo/screens/farmers/fruitAdded.dart';
import 'package:ngo/screens/farmers/vegetableAdded.dart';

class AddedProducts extends StatefulWidget {
  final String UserID;
  const AddedProducts({Key? key,required this.UserID}) : super(key: key);

  @override
  State<AddedProducts> createState() => _AddedProductsState();
}

class _AddedProductsState extends State<AddedProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Added"),
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
                  MaterialPageRoute(builder: (context) => FruitAdded(userID: widget.UserID)),
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
                  "Fruits",
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
                  MaterialPageRoute(builder: (context) => VegetableAdded(userID: widget.UserID)),
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
                  "Vegetables",
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
