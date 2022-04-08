import 'package:flutter/material.dart';
import 'package:ngo/screens/track/tracking_page.dart';
import '../../CustomWidget/final_cart.dart';

// ignore_for_file: prefer_const_constructors
bool? x = false;

class OrderTracking extends StatefulWidget {
  final String userID;
  const OrderTracking({Key? key,required this.userID}) : super(key: key);

  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  List<String> vegnames = ["Amla", "Cabbage", "Brocolli", "Bathua"];


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
                      return DummyClass(vegnames[index]);
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
  String vegnam;
  DummyClass(this.vegnam,
      {Key? key})
      : super(key: key);

  @override
  State<DummyClass> createState() => _DummyClassState();
}

class _DummyClassState extends State<DummyClass> {
  String?  vegname;
  @override
  void initState() {
    super.initState();
    vegname = widget.vegnam;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
      const SizedBox(height: 13),
      InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => TrackPage()),
          // );
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
