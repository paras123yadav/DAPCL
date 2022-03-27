import 'package:flutter/material.dart';
import 'package:ngo/screens/home_page.dart';
import 'package:ngo/screens/login/login.dart';
import 'package:ngo/screens/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
String? phone;
String? password;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  phone = preferences.getString('user_phone');
  // print(email);
  password = preferences.getString('user_password');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      phone==null?Login():Login(),
    );
  }
}
class BottomNavigationBarController extends StatefulWidget {
  final String phone;
  final String password;
  BottomNavigationBarController({Key? key,required this.phone,required this.password}) : super(key: key);

  @override
  _BottomNavigationBarControllerState createState() => _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState extends State<BottomNavigationBarController> {
  int _selectedPage = 0;
  List<Widget> pageList = [];
  String phone="",password="";

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
              onSelected: (value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );

              },
              itemBuilder:(context) =>  [
                PopupMenuItem(
                  onTap: (){
                  },
                  child: Text("Logout"),
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
      // ),
      body: IndexedStack(
        index: _selectedPage,
        children: [
          HomeScreen(phone: phone,password: password,),
          ProfilePage(phone: phone,password: password,),
          HomeScreen(phone: phone,password: password,),
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
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Track',
          ),
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
