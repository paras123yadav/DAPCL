import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../CustomWidget/final_cart.dart';

bool lund = true;

class CartPage extends StatefulWidget {
  // String email,password;
  // CartPage(this.email,this.password,{Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int currData = 0;
  Ans ans = Ans();
  var vegname = [];
  var vegprice = [];
  var vegquantity = [];
  var items = [];
  @override
  void initState() {
    super.initState();
    cart.forEach((key, value) {
      var temp = key.split("@");
      items.add(value);
      vegquantity.add(temp[1]);
      vegname.add(temp[0]);
      vegprice.add(temp[2]);
    });
    calculate();
    //  initialize(vegnam, items, vegpricesd, vegquantitys, ans)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          finalAppBar == true ? AppBar(backgroundColor: Colors.green) : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: ListView.builder(
                  itemCount: cart.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    //initialize(vegname[index],items[index],vegprice[index],vegquantity[index],ans);
                    // return Text("das");
                    // return finaldata(finalcart[index]!.values, veg, price)
                    return cartList(vegname[index], items[index],
                        vegprice[index], vegquantity[index], ans);
                    //    return bhnch(vegname[index],items[index],vegprice[index],vegquantity[index],ans);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 14.0, top: 10),
              child: InkWell(
                onTap: () {},
                child: const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Apply Coupon",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    )),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            customCartButton(),
          ],
        ),
      ),
    );
  }

  // Widget finaldata(String image,String veg,String price){
  //   return Column(
  //       children: [
  //         const SizedBox(height: 20),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             Card(child: Image.asset("assets/"+image,height: 90,width: 90,)),
  //             SizedBox(width: MediaQuery.of(context).size.width*0.04,),
  //             Wrap(
  //               direction: Axis.vertical,
  //               children: [
  //                 Text(veg,style: TextStyle(fontSize: 16)),
  //                 Text(price,style: TextStyle(fontSize: 16)),
  //                 SizedBox(height: 12),
  //                 Row(
  //                   children: [
  //                     SizedBox(width: MediaQuery.of(context).size.width*0.34),
  //                     Text("Rs 0.0",style: TextStyle(fontSize: 16))
  //                   ],
  //                 )
  //               ],
  //             )
  //           ],
  //         ),
  //       ]
  //   );
  // }
  Widget customCartButton() {
    return InkWell(
      onTap: () {
        print(cart.isEmpty);
        cart.forEach((key, value) {
          print(key + " " + value.toString());
        });
        if (cart.isNotEmpty) {
          setState(() {
            print(cart.values);
            setState(() {
              finalval = false;
              finalAppBar = true;
            });
          });
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(color: Colors.lightGreen[800]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Rs.${ans.value}",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              custom()
            ],
          ),
        ),
      ),
    );
  }

  Widget custom() {
    return Row(
      children: const [
        Text("Check Out", style: TextStyle(fontSize: 20, color: Colors.white)),
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(Icons.arrow_forward_ios_sharp, color: Colors.white),
        ),
      ],
    );
  }

  void calculate() {
    for (int i = 0; i < items.length; i++) {
      int y = int.parse(vegprice[i]);
      ans.value += (items[i] as int) * y;
    }
    print(ans);
  }

  Widget bhnch(String vegnam, int items, String vegpricesd, String vegquantitys,
      Ans ans) {
    return Column(children: [
      const SizedBox(height: 20),
      Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.grey.withOpacity(0.15)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              // Card(child: Image.asset("assets/"+image!,height: 90,
              //   width: MediaQuery.of(context).size.width*0.28,)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Wrap(
                  // direction: Axis.vertical,
                  direction: Axis.horizontal,
                  children: [
                    Text(vegnam.toString(),
                        style: TextStyle(
                            fontSize: 22, overflow: TextOverflow.ellipsis)),
                    Text(vegquantitys, style: TextStyle(fontSize: 16)),
                    Text("@ Rs.${vegpricesd.toString()}",
                        style: TextStyle(fontSize: 16)),
                    SizedBox(height: 12),
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.09),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration:
                            BoxDecoration(border: Border.all(width: 0.5)),
                        child: InkWell(
                            onTap: () {
                              if (items > 0) {
                                setState(() {
                                  items -= 1;
                                  if (items == 0) {
                                    int val = int.parse(vegpricesd);
                                    cart.remove(
                                        "$vegnam@$vegquantitys@$vegpricesd");
                                    ans.value -= val;
                                  } else {
                                    int val = int.parse(vegpricesd);
                                    cart["$vegnam@$vegquantitys@$vegpricesd"] =
                                        items;
                                    ans.value -= val;
                                  }
                                  print(ans.value);
                                  lund = true;
                                });
                              }
                            },
                            child: const Icon(Icons.remove))),
//                  SizedBox(width: MediaQuery.of(context).size.width*0.03),
                    Text(items.toString(), style: TextStyle(fontSize: 16)),
                    //SizedBox(width: MediaQuery.of(context).size.width*0.03),
                    Container(
                        decoration:
                            BoxDecoration(border: Border.all(width: 0.5)),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                int val = int.parse(vegpricesd);
                                ans.value += val;
                                items++;
                                cart["$vegnam@$vegquantitys@$vegpricesd"] =
                                    items;
                                finalval = false;
                                print(ans.value);
                                lund = false;
                              });
                              // addtocart.forEach((key, value) {
                              // });
                            },
                            child: const Icon(Icons.add))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  void initialize(String vegnam, int items, String vegpricesd,
      String vegquantitys, Ans ans) {
    int? x = 0;
    if (cart.containsKey("$vegnam@$vegquantitys@$vegpricesd") == true) {
      x = cart["$vegnam@$vegquantitys@$vegpricesd"];
      setState(() {
        currData = x!;
      });
    }
  }
}

class cartList extends StatefulWidget {
  String vegnam;
  int items;
  Ans ans = Ans();
  String vegprice, vegquantity;

  cartList(this.vegnam, this.items, this.vegprice, this.vegquantity, this.ans,
      {Key? key})
      : super(key: key);

  @override
  State<cartList> createState() => _cartListState();
}

class _cartListState extends State<cartList> {
  String? image, vegname, vegprices, vegquantity;
  int currData = 0, currIdxs = 0, finalitems = 0, finalans = 0;
  Map<String, int> addtocart = {};
  Ans ans = Ans();
  @override
  void initState() {
    int? x;
    super.initState();
    vegquantity = widget.vegquantity;
    vegname = widget.vegnam;
    vegprices = widget.vegprice;
    finalitems = widget.items;
    ans = widget.ans;
    if (cart.containsKey("$vegname@$vegquantity@$vegprices") == true) {
      x = cart["$vegname@$vegquantity@$vegprices"];
      setState(() {
        currData = x!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
      const SizedBox(height: 20),
      Container(
        height: MediaQuery.of(context).size.height * 0.14,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.grey.withOpacity(0.15)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              //    SizedBox(width: MediaQuery.of(context).size.width*0.02,),
              // Card(child: Image.asset("assets/"+image!,height: 90,
              //   width: MediaQuery.of(context).size.width*0.28,)),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(vegname!,
                      style: const TextStyle(
                          fontSize: 22, overflow: TextOverflow.ellipsis))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                children: [
                  Text(vegquantity!, style: TextStyle(fontSize: 18)),
                  Text("@ Rs.$vegprices", style: TextStyle(fontSize: 18)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.7)
                        ),
                        child: InkWell(
                            onTap: () {
                              if (currData > 0) {
                                setState(() {
                                  currData -= 1;

                                  if (currData == 0) {
                                    int val = int.parse(vegprices!);
                                    cart.remove("$vegname@$vegquantity@$vegprices");
                                    ans.value -= val;
                                  } else {
                                    int val = int.parse(vegprices!);
                                    cart["$vegname@$vegquantity@$vegprices"] =
                                        currData;
                                    ans.value -= val;
                                  }
                                  print(ans.value);
                                  lund = true;
                                });
                              }
                            },
                            child: const Icon(Icons.remove))),
                   SizedBox(width: MediaQuery.of(context).size.width*0.03),
                    Text(currData.toString(), style: TextStyle(fontSize: 16)),
                    SizedBox(width: MediaQuery.of(context).size.width*0.03),
                    Container(
                        decoration: BoxDecoration(border: Border.all(width: 0.7)),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                int val = int.parse(vegprices!);
                                ans.value += val;
                                currData++;
                                cart["$vegname@$vegquantity@$vegprices"] = currData;
                                finalval = false;
                                print(ans.value);
                                lund = false;
                              });
                              // addtocart.forEach((key, value) {
                              // });
                            },
                            child: const Icon(Icons.add))),

                  ],
                ),
              ),
              SizedBox(height: 12),
              SizedBox(width: MediaQuery.of(context).size.width * 0.09),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                             decoration: BoxDecoration(
//                                 border: Border.all(width: 0.5)
//                             ),
//                             child: InkWell(
//                                 onTap: (){
//                                   if(currData>0) {
//                                     setState(() {
//
//                                       currData-=1;
//
//                                       if(currData==0)
//                                       {
//                                         int val=int.parse(vegprices!);
//                                         cart.remove("$vegname@$vegquantity@$vegprices");
//                                         ans.value-=val;
//                                       }
//                                       else
//                                       {
//                                         int val=int.parse(vegprices!);
//                                         cart["$vegname@$vegquantity@$vegprices"] = currData;
//                                         ans.value-=val;
//                                       }
//                                       print(ans.value);
//                                       lund=true;
//                                     });
//                                   }
//                                 },
//
//                                 child: const Icon(Icons.remove))
//                         ),
// //                  SizedBox(width: MediaQuery.of(context).size.width*0.03),
//                         Text(currData.toString(),style: TextStyle(fontSize: 16)),
//                         //SizedBox(width: MediaQuery.of(context).size.width*0.03),
//                         Container(
//                             decoration: BoxDecoration(
//                                 border: Border.all(width: 0.5)
//                             ),
//                             child: InkWell(
//                                 onTap: (){
//                                   setState(() {
//                                     int val=int.parse(vegprices!);
//                                     ans.value+=val;
//                                     currData++;
//                                     cart["$vegname@$vegquantity@$vegprices"]=currData;
//                                     finalval=false;
//                                     print(ans.value);
//                                     lund=false;
//                                   });
//                                   // addtocart.forEach((key, value) {
//                                   // });
//                                 },
//                                 child: const Icon(Icons.add)
//                             )
//                         ),
//
//                       ],
//                     ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}

class Ans {
  int value;
  Ans({this.value = 0});
}
