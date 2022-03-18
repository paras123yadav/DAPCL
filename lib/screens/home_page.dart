import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngo/screens/dummy%20data/dummydata.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const IconButton(onPressed: null, icon: Icon(Icons.account_circle),iconSize: 36),
        actions: [
          customWallet(),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/veg.jpg'),
                      )
                  ),
                  height: 200,
                  width: 300,
                  margin: const EdgeInsets.all(10),
                  child: const Center(
                    child: Text(
                      "",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Product Category",
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                        child: Container(
                            margin: const EdgeInsets.all(7.5),
                            height: 170,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.grey.withOpacity(0.15)
                            ),
                            child: Column(
                              children: [
                            Image.asset("assets/fresh_veg.png",
                              height: 100,
                            ),
                            Center(
                                child: Text("Fresh Veg's",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                            ),
                            const SizedBox(height: 10,),
                            FittedBox(
                              child: Text("Available all year round"
                                ,style: GoogleFonts.nunito(),
                              ),
                            )
                          ],
                        )
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DummyData()),
                          );
                        },
                      )
                  ),
                  Expanded(
                      child: InkWell(
                        child: Container(
                            margin: const EdgeInsets.all(7.5),
                            height: 170,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.grey.withOpacity(0.15)
                            ),                        child: Column(
                          children: [
                            Image.asset("assets/sessional_veg.jpg",
                              height: 100,
                            ),
                            Center(
                                child: Text("Seasonal Veg's",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                            ),
                            const SizedBox(height: 10,),
                            FittedBox(
                              child: Text("Freshly Hand Picked"
                                ,style: GoogleFonts.nunito(),
                              ),
                            )
                          ],
                        )
                        ),
                        onTap: (){
                        },
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                        child: Container(
                            margin: const EdgeInsets.all(7.5),
                            height: 170,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.grey.withOpacity(0.15)
                            ),                        child: Column(
                          children: [
                            Image.asset("assets/hydroponics.jpeg",
                              height: 100,
                            ),
                            Center(
                                child: Text("Hydroponics",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                            ),
                            const SizedBox(height: 10,),
                            Text("Exotic Fruits and Vegetables"
                              ,style: GoogleFonts.nunito(),
                            )
                          ],
                        )
                        ),
                        onTap: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'We are working on this page.',
                                style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.pinkAccent,
                            ),
                          );

                        },
                      )
                  ),
                  Expanded(
                      child: InkWell(
                        child: Container(
                            margin: const EdgeInsets.all(7.5),
                            height: 170,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.grey.withOpacity(0.15)
                            ),                        child: Column(
                          children: [
                            Image.asset("assets/fresh_fruits.jpg",
                              height: 100,
                            ),
                            Center(
                                child: Text("Fresh Fruits",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                            ),
                            const SizedBox(height: 10,),
                            Text("Delicious"
                              ,style: GoogleFonts.nunito(),
                            )
                          ],
                        )
                        ),
                        onTap: (){
                        },
                      )
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Flexible(
              child: ListView.builder(
                itemCount: 15,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                  title: Text("List $index"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget customWallet(){
    return InkWell(
      onTap: (){

      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(5),
            side: const BorderSide(
                width: 1,
                color: Colors.grey
            )
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0,right: 4),
          child: Row(
            children: [
              const Icon(Icons.account_balance_wallet,color: Colors.black38),
              const SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("My Wallet"),
                  Text("Rs 00.00"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
