import 'package:flutter/material.dart';
class CartPage extends StatefulWidget {
  Map<String, int> cart;
  CartPage(this.cart, {Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Map<String, int> finalcart={};
  var finallist=[];
  @override
  void initState() {
    super.initState();
    finalcart=widget.cart;
    finalcart.forEach((k, v)
            {
              finallist.add(finalcart);
            }
            );
    print(finallist);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          SizedBox(
//             child: ListView.builder(
//                 itemCount: finalcart.length,
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   index=index%4;
//                   return finaldata(finalcart[index]!.values, veg, price)
// //                  return DummyClass(images[index],vegnames[index],vegprice[index],cart,index,items);
//                 }
//             ),
          ),
        ],
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
}