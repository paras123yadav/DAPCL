import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngo/main.dart';
import 'package:ngo/screens/farmers/productsAdded.dart';
import 'package:ngo/screens/farmers/sellerSearch.dart';
import 'package:ngo/screens/farmers/total_items_sold.dart';
import 'package:ngo/screens/search/searchPage.dart';
import 'package:ngo/screens/wallet/wallet_page.dart';
import '../../api/constant.dart';
import '../../models/Search.dart';
import '../dummy data/dummydata.dart';
class FarmersScreen2 extends StatefulWidget {
  final String phone, password,userID;
  const FarmersScreen2({Key? key, required this.phone, required this.password,required this.userID})
      : super(key: key);

  @override
  _FarmersScreen2State createState() => _FarmersScreen2State();
}

class _FarmersScreen2State extends State<FarmersScreen2> {

  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      top: MediaQuery.of(context).size.height * 0.02,
                      right: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: TextFormField(

                      textInputAction: TextInputAction.search,
                      controller: searchController,
                      cursorHeight: 24,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        hintStyle: TextStyle(fontSize: 18),
                        hintText: "Search",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onChanged: (String? val){
                        setState(() {
                        });
                      },
                      onFieldSubmitted: (String? val){
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SellerSearchPage(searchController.text,widget.userID)),
                          );
                        });
                      },
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.015,
                    ),
                    IconButton(
                      alignment: Alignment.center,
                      icon: Icon(Icons.search),
                      color: Colors.black38,
                      iconSize: 33,
                      onPressed: (){
                        if(searchController.text.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SellerSearchPage(searchController.text,widget.userID)),
                          );
                        }
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please Enter the field")));
                          //FetchData(searchController.text);
                        }
                      },
                    ),
                  ],
                )
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/veg.jpg'),
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.42,
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
              child: Text(
                "",
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                        child: Container(
                            margin: const EdgeInsets.all(7.5),
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.grey.withOpacity(0.15)
                            ),
                            child: Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width*0.35,
                                child: Text(
                                "Products Added",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddedProducts(UserID: widget.userID)),
                          );
                        },
                      )),
                  Expanded(
                      child: InkWell(
                        child: Container(
                            margin: const EdgeInsets.all(7.5),
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.grey.withOpacity(0.15)),
                            child: Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  SizedBox(
                                  width: MediaQuery.of(context).size.width*0.35,
                                  child: Text(
                                    "Total Items Sold",
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.bold,
                                        fontSize: 22
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                  Center(
                                    child: SizedBox(
                                      child: Text("= 10",
                                        style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                              ),
                            )),
                        onTap: () {},
                      )),
                ],
              ),
            ),
            const SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.only(),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                        child: Container(
                            margin: const EdgeInsets.all(7.5),
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.grey.withOpacity(0.15)),
                            child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                    width: MediaQuery.of(context).size.width*0.35,
                                    child: Text(
                                      "Total Items Sold in Last Week",
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold,
                                          fontSize: 22
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                    Center(
                                      child: SizedBox(
                                        child: Text("= 10",
                                          style: GoogleFonts.nunito(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                                ))),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TotalItemsSold(userID: widget.userID,)),
                          );
                        },
                      )),
                  Expanded(
                      child: InkWell(
                        child: Container(
                            margin: const EdgeInsets.all(7.5),
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.grey.withOpacity(0.15)),
                            child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    SizedBox(
                                    width: MediaQuery.of(context).size.width*0.35,
                                    child: Text(
                                      "Wallet",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.bold,
                                          fontSize: 22
                                      ),
                                    ),
                                  ),
                                    Center(
                                      child: SizedBox(
                                        child: Text("Balance = Rs.100",
                                          style: GoogleFonts.nunito(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19
                                          ),
                                        ),
                                      ),
                                    ),
                                   ]
                                ))),
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return WalletScreen(widget.userID);
                              }));
                        },
                      )),
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
