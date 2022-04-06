import 'package:flutter/material.dart';

class AddedProducts extends StatefulWidget {
  const AddedProducts({Key? key}) : super(key: key);

  @override
  State<AddedProducts> createState() => _AddedProductsState();
}

class _AddedProductsState extends State<AddedProducts> {
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
            child: InkWell(
              onTap: (){

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
