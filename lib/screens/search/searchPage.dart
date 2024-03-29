import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../CustomWidget/final_cart.dart';
import '../../api/constant.dart';
import '../../models/Search.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  String searchText;
  SearchPage(this.searchText, {Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ProductDetails> productDetails = [];
  @override
  void initState() {
    super.initState();
    FetchData(widget.searchText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.searchText),
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
                    return Dummy2(
                      productDetails[index].productImage.toString(),
                      productDetails[index].productName.toString(),
                      "@" +
                          productDetails[index]
                              .varients[0]
                              .quantity
                              .toString() +
                          productDetails[index].varients[0].unit.toString() +
                          " @ " +
                          productDetails[index].varients[0].mrp.toString(),
                      // vegprice[index],
                      //cart,index,items
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  FetchData(String text) async {
    var params = {
      "keyword": text,
    };
    var response = await http
        .post(Uri.parse(searchQuery).replace(queryParameters: params));
    if (response.statusCode == 200) {
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
  String vegnam, vegprice;
  //,vegprice;
  //int currIdx,items;
//  Map<String, int> cart;
  Dummy2(this.imag,this.vegnam, this.vegprice, {Key? key}) : super(key: key);

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
                    "https://farmer.cropnet.co.in/"+image,
                    height: 90,
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
                              fontSize: 16, overflow: TextOverflow.ellipsis)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    Text(vegprices.substring(1),
                        style: TextStyle(fontSize: 16)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              decoration:
                                  BoxDecoration(border: Border.all(width: 0.5)),
                              child: InkWell(
                                  onTap: () {
                                    if (currData > 0) {
                                      setState(() {
                                        currData -= 1;
                                        if (currData == 0) {
                                          cart.remove(vegname + vegprices);
                                        } else {
                                          cart[vegname + vegprices] = currData;
                                        }
                                      });
                                    }
                                    print(cart.values);
                                  },
                                  child: const Icon(Icons.remove))),
//                  SizedBox(width: MediaQuery.of(context).size.width*0.03),
                          Text(currData.toString(),
                              style: TextStyle(fontSize: 16)),
                          //                SizedBox(width: MediaQuery.of(context).size.width*0.03),
                          Container(
                              decoration:
                                  BoxDecoration(border: Border.all(width: 0.5)),
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      currData++;
                                      cart[vegname + vegprices] = currData;
                                    });
                                    print(cart.values);
                                    // cart.forEach((key, value) {
                                    // });
                                  },
                                  child: const Icon(Icons.add))),
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
