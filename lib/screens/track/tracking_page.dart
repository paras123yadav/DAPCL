import 'package:flutter/material.dart';
import '../../CustomWidget/final_cart.dart';
import '../cart/add_to_cart.dart';
import 'order_tracking.dart';
// ignore_for_file: prefer_const_constructors
bool? x=false;
class TrackPage extends StatefulWidget {
  final String userID;
  const TrackPage({Key? key,required this.userID}) : super(key: key);

  @override
  _TrackPageState createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: ListView.builder(
                    itemCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      index=index%4;
                      return DummyClass(userID: widget.userID,);
                    }
                ),
              ),
            ],
          ),
        ),
    );
    //   x!=null?
    //   customCartButton():Text(""),
    // );
  }

}
class DummyClass extends StatefulWidget {
  final String userID;
  DummyClass({Key? key,required this.userID}) : super(key: key);

  @override
  State<DummyClass> createState() => _DummyClassState();
}

class _DummyClassState extends State<DummyClass> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const SizedBox(height: 13),
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderTracking(userID: widget.userID,)),
              );

            },
            child: SizedBox(
            width: MediaQuery.of(context).size.width*0.9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.withOpacity(0.3),
                ),
                height: MediaQuery.of(context).size.height*0.09,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.01,),
                    SizedBox(width: MediaQuery.of(context).size.width*0.06,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.2,
                      child: Wrap(
                        direction: Axis.vertical,
                        children: [
                          Text("Order ID:",
                              style: TextStyle(fontSize: 19)
                          ),
                          Text("Order Status:",
                              style: TextStyle(fontSize: 16)
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]
    );
  }
}