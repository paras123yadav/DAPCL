import 'package:flutter/material.dart';
import '../../CustomWidget/final_cart.dart';
class CartPage extends StatefulWidget {
  // String email,password;
  // CartPage(this.email,this.password,{Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int ans=0;
  var vegname=[];
  var vegprice=[];
  var vegquantity=[];
  var items=[];
  @override
  void initState() {
    super.initState();
    cart.forEach((key, value) {
      var temp=key.split("@");
      items.add(value);
      vegquantity.add(temp[1]);
      vegname.add(temp[0]);
      vegprice.add(temp[2]);
    });
    calculate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: finalAppBar==true? AppBar(
          backgroundColor: Colors.green
      ):null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: ListView.builder(
                  itemCount: cart.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // return Text("das");
                    // return finaldata(finalcart[index]!.values, veg, price)
                    return cartList(vegname[index],items[index],vegprice[index],vegquantity[index]);
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget finaldata(String image,String veg,String price){
    return Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(child: Image.asset("assets/"+image,height: 90,width: 90,)),
              SizedBox(width: MediaQuery.of(context).size.width*0.04,),
              Wrap(
                direction: Axis.vertical,
                children: [
                  Text(veg,style: TextStyle(fontSize: 16)),
                  Text(price,style: TextStyle(fontSize: 16)),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*0.34),
                      Text("Rs 0.0",style: TextStyle(fontSize: 16))
                    ],
                  )
                ],
              )
            ],
          ),
        ]
    );
  }
  void calculate() {
      for(int i=0; i<items.length ;i++){
        int y=int.parse(vegprice[i]);
        ans+=(items[i] as int) * y;
      }
      print(ans);

  }
}
class cartList extends StatefulWidget {
  String vegnam;
  int items;
  String vegprice, vegquantity;

  cartList(this.vegnam,this.items, this.vegprice, this.vegquantity,{Key? key}) : super(key: key);

  @override
  State<cartList> createState() => _cartListState();
}

class _cartListState extends State<cartList> {
  String? image,vegname,vegprices,vegquantity;
  int currData=0,currIdxs=0,finalitems=0;
  Map<String, int> addtocart={};
  @override
  void initState() {
    int? x;
    super.initState();
    vegquantity=widget.vegquantity;
    vegname=widget.vegnam;
    vegprices=widget.vegprice;
    finalitems=widget.items;
    if(cart.containsKey("$vegname@$vegquantity@$vegprices")==true)
    {x=cart["$vegname@$vegquantity@$vegprices"];
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
          Container(
            height: MediaQuery.of(context).size.height*0.1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.withOpacity(0.15)
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                  // Card(child: Image.asset("assets/"+image!,height: 90,
                  //   width: MediaQuery.of(context).size.width*0.28,)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Wrap(
                      // direction: Axis.vertical,
                      direction: Axis.horizontal,
                      children: [
                        Text(vegname!,style: TextStyle(fontSize: 22,overflow: TextOverflow.ellipsis)),
                        Text(vegquantity!,style: TextStyle(fontSize: 16)),
                        Text("@ Rs.$vegprices",style: TextStyle(fontSize: 16)),
                        SizedBox(height: 12),
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
                                        cart.remove("$vegname@$vegquantity@$vegprices");

                                      }
                                      else
                                      {
                                        cart["$vegname@$vegquantity@$vegprices"] = currData;
                                      }
                                    });
                                  }
                                },

                                child: const Icon(Icons.remove))
                        ),
//                  SizedBox(width: MediaQuery.of(context).size.width*0.03),
                        Text(currData.toString(),style: TextStyle(fontSize: 16)),
                        //SizedBox(width: MediaQuery.of(context).size.width*0.03),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 0.5)
                            ),
                            child: InkWell(
                                onTap: (){
                                  setState(() {
                                    currData++;
                                    cart["$vegname@$vegquantity@$vegprices"]=currData;
                                    finalval=false;
                                  });
                                  // addtocart.forEach((key, value) {
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
            ),
          ),
        ]
    );
  }

}