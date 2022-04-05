import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../CustomWidget/final_cart.dart';
import '../cart/add_to_cart.dart';
import '../cart/empty_cart.dart';
import '../login/login.dart';
import '../profile_page.dart';
import 'farmers_dashboard.dart';
class BottomNavigationBarController2 extends StatefulWidget {
  final String phone;
  final String password;
  BottomNavigationBarController2({Key? key,required this.phone,required this.password}) : super(key: key);

  @override
  _BottomNavigationBarController2State createState() => _BottomNavigationBarController2State();
}

class _BottomNavigationBarController2State extends State<BottomNavigationBarController2> {
  int _selectedPage = 0;
  List<Widget> pageList = [];
  String phone="sdssd",password="sdsdsd";
  @override
  void initState() {
    super.initState();
    phone=widget.phone;
    password=widget.password;
    // pageList.add(const HomeScreen());
    // pageList.add( ProfilePage(phone: phone,password: password,));
    // pageList.add(const HomeScreen());
    // pageList.add( ProfilePage(phone: phone,password: password,));
    print("jklj"+phone+password);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("")),
        automaticallyImplyLeading: false,
        // leading: const IconButton(onPressed: null, icon: Icon(Icons.account_circle),iconSize: 36),
        actions: [
          PopupMenuButton(
              elevation: 20,
              enabled: true,
              onSelected: (value) async {
                SharedPreferences preferences = await SharedPreferences.getInstance();
                await preferences.clear();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );

              },
              itemBuilder:(context) =>  [
                PopupMenuItem(
                  onTap: (){
                  },
                  child: const Text("Logout"),
                  value: "Logout",
                ),
              ]
          )
          //          customwallet(),
        ],
        backgroundColor: Colors.green,
      ),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //  leading: const IconButton(onPressed: null, icon: Icon(Icons.account_circle),iconSize: 36),
      //   actions: [
      //     customwallet(),
      //   ],
      //   backgroundColor: Colors.white,
      // image pic + image name: quantity
      // ),
      body: IndexedStack(
        index: _selectedPage,
        children: [
          FarmersScreen2(phone: phone, password: password),
          //HomeScreen(phone: phone,password: password),
          cart.isEmpty?EmptyCart():CartPage(),
//          ProfilePage(phone: phone,password: password,),
          ProfilePage(phone: phone,password: password,)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: "Add Product",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.track_changes),
          //   label: 'Track',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedPage,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
      finalAppBar=false;
    });
  }
  Widget customwallet(){
    return InkWell(
      onTap: (){},
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
              Icon(Icons.account_balance_wallet,color: Colors.black38),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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