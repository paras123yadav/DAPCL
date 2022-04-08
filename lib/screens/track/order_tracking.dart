import 'package:flutter/material.dart';
import '../../CustomWidget/final_cart.dart';

// ignore_for_file: prefer_const_constructors
bool? x = false;

class OrderTracking extends StatefulWidget {
  const OrderTracking({Key? key}) : super(key: key);

  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  int data = 0;
  int items = 0;
  List<String> images = [
    "fresh_fruits.jpg",
    "fresh_veg.png",
    "sessional_veg.jpg",
    "veg.jpg"
  ];
  List<String> vegnames = ["Amla", "Cabbage", "Brocolli", "Bathua"];
  List<String> vegprice = [
    "250g @ 22.50",
    "1 Kg @ 40.00 ",
    "500 g @ 50.00",
    "500 g @ 28.0"
  ];
  List<int> datas = [0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Order ID"),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text("Order Status", style: TextStyle(fontSize: 20)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Text("In Progress", style: TextStyle(fontSize: 28,color: Colors.green)),

              SizedBox(
                child: ListView.builder(
                    itemCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      index = index % 4;
                      return DummyClass(images[index], vegnames[index],
                          vegprice[index], cart, index, items);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DummyClass extends StatefulWidget {
  String imag, vegnam, vegprice;
  int currIdx, items;
  Map<String, int> cart;
  DummyClass(this.imag, this.vegnam, this.vegprice, this.cart, this.currIdx,
      this.items,
      {Key? key})
      : super(key: key);

  @override
  State<DummyClass> createState() => _DummyClassState();
}

class _DummyClassState extends State<DummyClass> {
  String? image, vegname, vegprices;
  int currData = 0, currIdxs = 0, finalitems = 0;
  Map<String, int> addtocart = {};
  @override
  void initState() {
    int? x;
    super.initState();
    image = widget.imag;
    vegname = widget.vegnam;
    vegprices = widget.vegprice;
    addtocart = widget.cart;
    currIdxs = widget.currIdx;
    finalitems = widget.items;
    if (cart.containsKey(vegname) == true) {
      x = cart["$vegname"];
      setState(() {
        currData = x!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
      const SizedBox(height: 13),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OrderTracking()),
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey.withOpacity(0.3),
            ),
            height: MediaQuery.of(context).size.height * 0.09,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.06,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text(vegname!, style: TextStyle(fontSize: 22)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
