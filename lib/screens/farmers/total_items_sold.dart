import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ngo/main.dart';
import 'package:ngo/screens/cart/add_to_cart.dart';

import '../../CustomWidget/final_cart.dart';
import '../../api/constant.dart';
import '../../models/Search.dart';
import 'package:http/http.dart' as http;

class TotalItemsSold extends StatefulWidget {
  final String userID;
  TotalItemsSold( {Key? key,required this.userID}) : super(key: key);

  @override
  State<TotalItemsSold> createState() => _TotalItemsSoldState();
}

class _TotalItemsSoldState extends State<TotalItemsSold> {
  List<ProductDetails> productDetails = [];
  @override
  void initState() {
    super.initState();
    FetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Sold (In a Week)"),
        backgroundColor: Colors.green,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: ListView.builder(
                  itemCount: productDetails.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if(productDetails[index].varients.isEmpty){
                      return SizedBox();
                    }else
                    {
                      int j=index;
                      int i=productDetails[index].varients.length;
                      while(i-->=0){

                        return Dummy2(
                          productDetails[index].productImage.toString(),
                          productDetails[j].productName.toString(),
                          productDetails[j].varients[i].price.toString(),
                          productDetails[j].varients[i].quantity.toString() +
                          productDetails[j].varients[i].unit.toString(),


                          // vegprice[index],
                          //cart,index,items
                        );
                      }
                      return SizedBox();
                    }
                  }),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.1,
            )
          ],
        ),
      ),

    );
  }

  FetchData() async {
    var params = {
      "user_id": widget.userID,
    };
    var response = await http
        .get(Uri.parse(fruitList).replace(queryParameters: params));
    if (response.statusCode == 200) {
      print(widget.userID);
      var json = jsonDecode(response.body);
      var data = Product.fromJson(json);
      if (json["status"] == "1") {
        setState(() {
          if (data.data != null) {
            productDetails = data.data;
            // userDetail=data.data;
            // nameController.text=userDetail[0].userName!;
            // emailController.text=userDetail[0].userEmail!;
            // passwordController.text=userDetail[0].userPassword!;
            // mobileController.text=userDetail[0].userPhone!;
          }
          print(productDetails[0].productName);
        });
        //  print(userDetail[0].userName);
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Product Not Found")));
      }
    }
  }
}

class Dummy2 extends StatefulWidget {
  String imag;
  String vegnam, vegprice,vegquantity;
  //,vegprice;
  //int currIdx,items;
//  Map<String, int> cart;
  Dummy2(this.imag,this.vegnam, this.vegprice, this.vegquantity,{Key? key}) : super(key: key);

  @override
  State<Dummy2> createState() => _Dummy2State();
}

class _Dummy2State extends State<Dummy2> {
  late String image, vegname, vegprices;
  int currData = 0, currIdxs = 0, finalitems = 0;
  Map<String, int> addtocart = {};
  @override
  void initState() {
    int? x;
    super.initState();
    image=widget.imag;
    vegname = widget.vegnam;
    vegprices = widget.vegprice;
    // addtocart=widget.cart;
    // currIdxs=widget.currIdx;
    // finalitems=widget.items;
    if (cart.containsKey(vegname + vegprices) == true) {
      x = cart[vegname + vegprices];
      setState(() {
        currData = x!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.14,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey.withOpacity(0.15)),
              child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Card(
                              child: Image.network(
                                "https://farmer.cropnet.co.in/$image",
                                height: 90,
                                fit: BoxFit.contain,
                                width: MediaQuery.of(context).size.width * 0.28,
                              )),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.06,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // direction: Axis.horizontal,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(vegname,
                                  style: const TextStyle(
                                      fontSize: 22, overflow: TextOverflow.ellipsis)),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.005,
                            ),
                            Text("Rs. "+vegprices,
                                style: TextStyle(fontSize: 18)),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("x"+widget.vegquantity,style: TextStyle(fontSize: 20)),
                                ],
                              ),
                            )
                          ],
                        ),
                        //     SizedBox(width: MediaQuery.of(context).size.width*0.09),
                      ],
                    ),
                  ]),
            ),
          ),
        ]);
  }
}
