import 'package:flutter/material.dart';
import '../cart/add_to_cart.dart';
// ignore_for_file: prefer_const_constructors

class DummyData extends StatefulWidget {
  const DummyData({Key? key}) : super(key: key);

  @override
  _DummyDataState createState() => _DummyDataState();
}

class _DummyDataState extends State<DummyData> {
  bool x=false;
  Map<String,int> cart={};
  int data=0;
  int items=0;
  List<String> images=["fresh_fruits.jpg","fresh_veg.png","sessional_veg.jpg","veg.jpg"];
  List<String> vegnames=["Amla","Cabbage","Brocolli","Bathua"];
  List<String> vegprice=["250g @ 22.50","1 Kg @ 40.00 ","500 g @ 50.00","500 g @ 28.0"];
  List<int> datas=[0,0,0,0,0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Fresh Veg's Products"),
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          SizedBox(
            child: ListView.builder(
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                index=index%4;
                return DummyClass(images[index],vegnames[index],vegprice[index],cart,index,items);
              }
        ),
          ),
        ],
        ),
      ),
      floatingActionButton: x!=true?
      customCartButton():Text(""),
    );
  }

  Widget customCartButton(){
    return InkWell(
      onTap: (){
        print(cart.isEmpty);
        cart.forEach((key, value) {
          print(key+" "+value.toString());
        });
        if(cart.isNotEmpty) {
           setState(() {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => const CartPage()),
             );
            });
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0,right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.lightGreen[800]
            ),
            child: Row(
              children: [
                const SizedBox(width: 14),
                const Icon(Icons.shopping_bag,size: 36,color: Colors.white),
                const SizedBox(width: 10,),
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text("${cart.length} items",style: TextStyle(color: Colors.white)),
                    Text("Rs 0.00",style: TextStyle(fontSize: 22,color: Colors.white)),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.14,),
                const Text("Add to Cart",style: TextStyle(fontSize: 20,color: Colors.white)),
                const Icon(Icons.arrow_forward_ios_sharp,color: Colors.white),
                const SizedBox(width: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class DummyClass extends StatefulWidget {
  String imag,vegnam,vegprice;
  int currIdx,items;
  Map<String, int> cart;
  DummyClass(this.imag,this.vegnam,this.vegprice,this.cart,this.currIdx,this.items,{Key? key}) : super(key: key);

  @override
  State<DummyClass> createState() => _DummyClassState();
}

class _DummyClassState extends State<DummyClass> {
  String? image,vegname,vegprices;
  int currData=0,currIdxs=0,finalitems=0;
  late Map<String, int> addtocart;
  @override
  void initState() {
    super.initState();
    image=widget.imag;
    vegname=widget.vegnam;
    vegprices=widget.vegprice;
    addtocart=widget.cart;
    currIdxs=widget.currIdx;
    finalitems=widget.items;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width*0.01,),
              Card(child: Image.asset("assets/"+image!,height: 90,
                width: MediaQuery.of(context).size.width*0.28,)),
              SizedBox(width: MediaQuery.of(context).size.width*0.06,),
              Wrap(
                direction: Axis.vertical,
                children: [
                  Text(vegname!,style: TextStyle(fontSize: 16)),
                  Text(vegprices!,style: TextStyle(fontSize: 16)),
                  SizedBox(height: 12),
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.12),
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
                            addtocart.remove(vegname);
                            }
                            else
                              {
                            addtocart[vegname!] = currData;
                          }
                        });
                        }
                      },

                      child: const Icon(Icons.remove))
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.03),
              Text(currData.toString(),style: TextStyle(fontSize: 16)),
              SizedBox(width: MediaQuery.of(context).size.width*0.03),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5)
                  ),
                  child: InkWell(
                      onTap: (){
                        setState(() {
                          currData++;
                          addtocart[vegname.toString()]=currData;
                          //items=addtocart.length;
                        });
                        // addtocart.forEach((key, value) {
                        // });
                      },
                      child: const Icon(Icons.add)
                  )
              ),
            ],
          ),
        ]
        ),
    ]
    );
  }
}

