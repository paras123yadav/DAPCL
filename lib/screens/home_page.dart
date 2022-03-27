import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore_for_file: prefer_const_constructors
import 'dummy data/dummydata.dart';
class HomeScreen extends StatefulWidget {
  final String phone,password;
  const HomeScreen({Key? key,required this.phone,required this.password}) : super(key: key);


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width*0.02,
                  right: MediaQuery.of(context).size.width*0.02,
                  top:MediaQuery.of(context).size.width*0.01
              ),
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: "Search"
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.2,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  decoration:  BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/veg.jpg'),
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: MediaQuery.of(context).size.height*0.2,
                  width: MediaQuery.of(context).size.width*0.42,
                  margin: EdgeInsets.all(10),
                  child: Center(
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
                            ),                        child: Column(
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
            // Flexible(
            //   child: ListView.builder(
            //     itemCount: 15,
            //     physics: NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,
            //     itemBuilder: (context, index) => ListTile(
            //       title: Text("List $index"),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}