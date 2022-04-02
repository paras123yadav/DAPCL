import 'dart:convert';

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
  List<ProductDetails> productDetails=[];
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
                        //productDetails[index].productImage.toString(),
                        productDetails[index].productName.toString(),
                      "@"+productDetails[index].varients[0].quantity.toString()+productDetails[index].varients[0].unit.toString()+" @ "+productDetails[index].varients[0].price.toString(),
                      // vegprice[index],
                        //cart,index,items
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
  FetchData(String text) async {
    var params={"keyword":text,
    };
    var response=await http.post(
        Uri.parse(searchQuery)
            .replace(queryParameters: params)
    );
    if(response.statusCode==200)
    {var json=jsonDecode(response.body);
    var data=Product.fromJson(json);
    if(json["status"]=="1") {
      setState(() {
        if(data.data!=null){
          productDetails=data.data;
          // userDetail=data.data;
          // nameController.text=userDetail[0].userName!;
          // emailController.text=userDetail[0].userEmail!;
          // passwordController.text=userDetail[0].userPassword!;
          // mobileController.text=userDetail[0].userPhone!;
        }
        print(productDetails[0].productName);
      });
      //  print(userDetail[0].userName);
    }
    else
    { Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Product Not Found")));

    }
    }
  }
}
class Dummy2 extends StatefulWidget {
  //String imag;
  String vegnam,vegprice;
  //,vegprice;
  //int currIdx,items;
//  Map<String, int> cart;
  Dummy2(this.vegnam,this.vegprice,{Key? key}) : super(key: key);

  @override
  State<Dummy2> createState() => _Dummy2State();
}

class _Dummy2State extends State<Dummy2> {
  late String image,vegname,vegprices;
  int currData=0,currIdxs=0,finalitems=0;
  Map<String, int> addtocart={};
  @override
  void initState() {
    int? x;
    super.initState();
//    image=widget.imag;
    vegname=widget.vegnam;
     vegprices=widget.vegprice;
    // addtocart=widget.cart;
    // currIdxs=widget.currIdx;
    // finalitems=widget.items;
    if(cart.containsKey(vegname+vegprices)==true)
    {x=cart[vegname+vegprices];
    setState(() {
      currData=x!;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width*0.01,),
              Card(
                  child: Image.asset(
                    "assets/veg.jpg",
                    height: 90,
                width: MediaQuery.of(context).size.width*0.28,)
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.06,),
              SizedBox(

                width: MediaQuery.of(context).size.width*0.2,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Text(vegname,style: const TextStyle(fontSize: 16,
                        overflow: TextOverflow.ellipsis)),
                    Text(vegprices,style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.09),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.5)
                        ),
                        child: InkWell(
                            onTap: (){
                              if(currData>0) {
                                setState(() {
                                  currData-=1;
                                  if(currData==0)
                                  {
                                    cart.remove(vegname+vegprices);
                                  }
                                  else
                                  {
                                    cart[vegname+vegprices] = currData;
                                  }
                                });
                              }
                              print(cart.values);
                            },

                            child: const Icon(Icons.remove))
                    ),
//                  SizedBox(width: MediaQuery.of(context).size.width*0.03),
                    Text(currData.toString(),style: TextStyle(fontSize: 16)),
                    //                SizedBox(width: MediaQuery.of(context).size.width*0.03),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.5)
                        ),
                        child: InkWell(
                            onTap: (){
                              setState(() {
                                currData++;
                                cart[vegname+vegprices]=currData;
                              });
                              print(cart.values);
                              // cart.forEach((key, value) {
                              // });
                            },
                            child: const Icon(Icons.add)
                        )
                    ),

                  ],
                ),
              )
            ],
          ),
        ]
    );
  }
}
