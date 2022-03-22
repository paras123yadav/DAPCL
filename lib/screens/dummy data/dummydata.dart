import 'package:flutter/material.dart';
class DummyData extends StatefulWidget {
  const DummyData({Key? key}) : super(key: key);

  @override
  _DummyDataState createState() => _DummyDataState();
}

class _DummyDataState extends State<DummyData> {
  int data=0;
  int wid=0;
  List<String> images=["fresh_fruits.jpg","fresh_veg.png","sessional_veg.jpg","veg.jpg"];
  List<String> vegnames=["Amla","Cabbage","Brocolli","Bathua"];
  List<String> vegprice=["250g @ 22.5","1 Kg @ 40.0","500g @ 50.0","500g @ 28.0"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
        title: const Text("Fresh Veg's Products"),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: 4,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return dummydata(images[index],vegnames[index],vegprice[index]);
          }
        ),
      ),
      floatingActionButton: wid==0?const Text(""):customCartButton(),
    );
  }
  Widget dummydata(String image,String veg,String price){
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
        children: [
          Card(child: Image.asset("assets/"+image,height: 90,width: 90,)),
          Wrap(
            direction: Axis.vertical,
            children: [
              Text(veg),
              Text(price),
              const SizedBox(height: 10),
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
                              wid--;
                            });
                            }
                          },

                          child: const Icon(Icons.remove))
                  ),
                  const SizedBox(width: 7),
                  Text(data.toString()),
                  const SizedBox(width: 7),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5)
                      ),
                      child: InkWell(
                          onTap: (){
                            setState(() {
                              data++;
                              wid++;
                            });
                          },
                          child: const Icon(Icons.add)
                      )
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
  Widget customCartButton(){
    return InkWell(
      onTap: (){

      },
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0,right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60,
            width: double.infinity,
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
                  children: const [
                    Text("1 items",style: TextStyle(color: Colors.white)),
                    Text("Rs 20",style: TextStyle(fontSize: 22,color: Colors.white)),
                    ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.24,),
                const Text("Add to Cart",style: TextStyle(fontSize: 20,color: Colors.white)),
                const Icon(Icons.arrow_forward_ios_sharp,color: Colors.white),
              ],
            ),
          ),
          ),
        ),
    );
  }
}
