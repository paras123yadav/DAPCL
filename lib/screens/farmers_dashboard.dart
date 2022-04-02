import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngo/screens/search/searchPage.dart';
// ignore_for_file: prefer_const_constructors
import '../api/constant.dart';
import '../models/Search.dart';
import 'dummy data/dummydata.dart';
class FarmersScreen2 extends StatefulWidget {
  final String phone, password;
  const FarmersScreen2({Key? key, required this.phone, required this.password})
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
                      controller: searchController,
                      cursorHeight: 24,
                      decoration: InputDecoration(
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
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.black38,
                  onPressed: (){
                    if(searchController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SearchPage(searchController.text)),
                      );
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please Enter the field")));
                      //FetchData(searchController.text);
                    }
                  },
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
              child: Text(
                "",
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold, fontSize: 20),
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
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.grey.withOpacity(0.15)),
                            child: Wrap(
                              children: [
                                Text(
                                "Products Added",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26
                                ),
                              ),
                                ]
                            )),
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => DummyData()),
                          // );
                        },
                      )),
                  Expanded(
                      child: InkWell(
                        child: Container(
                            margin: const EdgeInsets.all(7.5),
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.grey.withOpacity(0.15)),
                            child: Center(
                              child: Text(
                                "Total Items Sold",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                        onTap: () {},
                      )),
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
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.grey.withOpacity(0.15)),
                            child: Center(
                                child: Text(
                                  "Total Items Sold in Last Week",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))),
                        onTap: () {
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
                      )),
                  Expanded(
                      child: InkWell(
                        child: Container(
                            margin: const EdgeInsets.all(7.5),
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.grey.withOpacity(0.15)),
                            child: Center(
                                child: Text(
                                  "Wallet",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))),
                        onTap: () {},
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
