import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ngo/api/constant.dart';
import 'package:ngo/screens/login/ForgotPasswordOTP.dart';
import 'package:http/http.dart' as http;
import 'package:ngo/screens/login/login.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class newPasswordScreen extends StatefulWidget {
  final String? phoneNumber;
  newPasswordScreen(this.phoneNumber);
  @override
  State<newPasswordScreen> createState() => _newPasswordScreenState();
}

class _newPasswordScreenState extends State<newPasswordScreen> {
  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          // height: MediaQuery.of(context).size.height - 150,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height*0.12,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                child:
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/verify.png'))),
                ),
              ),
              Column(
                children: <Widget>[
                  Text(
                    "New Password",
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.04,
                  ),
                  Text(
                    "Please enter your new Password",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.05,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  TextField(

                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: 'New Password',
                      focusedBorder: OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    autofocus: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.08,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding:
                  EdgeInsets.only(top: 3, left: 3, right: 3, bottom: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      setNewPassword(widget.phoneNumber,passwordController.text);
                    },
                    color: Colors.green,
                    // color: Color.fromRGBO(121, 130, 191, 1),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(
                      "Set Password",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
              ),

            ],
          ),

        ),
      ),
    );
  }

  verificationOtp(String phone) async{
    var params={"user_phone":phone,
    };
    var response=await http.post(
        Uri.parse(verifyOtp)
            .replace(queryParameters: params)
    );
    if(response.statusCode==200)
    {var json=jsonDecode(response.body);
    if(json["status"]=="1") {

      // print("SUccess");
      return true;
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User not registered!!")));
      return false;
    }
    }
    return false;
  }

   setNewPassword(String? phoneNumber, String password) async {
     var params = {"user_phone": phoneNumber, "user_password": password};
     var response = await http
         .post(Uri.parse(setPassword).replace(queryParameters: params));
     if (response.statusCode == 200) {
       var json = jsonDecode(response.body);
       print("SUccess1");
       print(json["message"]);
       print(phoneNumber);
       if (json["status"] == "1") {
         Navigator.push(context,
             MaterialPageRoute(builder: (context){
               return Login();
             }
             )
         );
       } else {
         ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text("Fuck Y !!")));
         return false;
       }
     } else {
       ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text("Please try after sometime!!")));
       return false;
     }
   }
}
