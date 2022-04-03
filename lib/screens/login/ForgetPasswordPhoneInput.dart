import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ngo/api/constant.dart';
import 'package:ngo/screens/login/ForgotPasswordOTP.dart';
import 'package:ngo/screens/login/otp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class phoneInputPassword extends StatefulWidget {
  @override
  State<phoneInputPassword> createState() => _phoneInputPasswordState();
}

class _phoneInputPasswordState extends State<phoneInputPassword> {
  TextEditingController phoneController=TextEditingController();

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
                    "Forgot Password !",
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.04,
                  ),
                  Text(
                    "Please enter your number to continue",
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
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 18),
                      border: OutlineInputBorder(),
                      labelText: 'Phone number',
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: '+91 phone number',
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
                      phoneController.text.length==10?verificationOtp(phoneController.text):ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please Enter a valid phone number'),
                        ),
                      );
                    },
                    color: Colors.green,
                    // color: Color.fromRGBO(121, 130, 191, 1),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(
                      "Generate OTP",
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
      print(phone);
      Navigator.push(context,
          MaterialPageRoute(builder: (context){
            return PinCodeVerificationScreenPassword(phone);
          }
          )
      );
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
}
