import 'package:flutter/material.dart';
class DummyData extends StatefulWidget {
  const DummyData({Key? key}) : super(key: key);

  @override
  _DummyDataState createState() => _DummyDataState();
}

class _DummyDataState extends State<DummyData> {
  int data=0;

  List<String> images=["fresh_fruits.jpg","fresh_veg.png","sessional_veg.jpg","veg.jpg"];
  List<String> vegnames=["Amla","Cabbage","Brocolli","Bathua"];
  List<String> vegprice=["250g @ 22.5","1 Kg @ 40.0","500g @ 50.0","500g @ 28.0"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: Text("Fresh Veg's Products"),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: 4,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return dummydata(images[index],vegnames[index],vegprice[index]);
          }
        ),
      ),
    );
  }
  Widget dummydata(String image,String veg,String price){
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
        children: [
          Card(child: Image.asset("assets/"+image,height: 90,width: 90,)),
          Wrap(
            direction: Axis.vertical,
            children: [
              Text(veg),
              Text(price),
              SizedBox(height: 10),
              Row(
                children: [
                  Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5)
                  ),
                      child: InkWell(
                          onTap: (){
                            if(data!=0) {
                              setState(() {
                              data--;
                            });
                            }
                          },
                          child: Icon(Icons.remove))
                  ),
                  SizedBox(width: 7),
                  Text(data.toString()),
                  SizedBox(width: 7),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5)
                      ),
                      child: InkWell(
                          onTap: (){
                            setState(() {
                              data++;
                            });
                          },
                          child: Icon(Icons.add))
                  ),
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
