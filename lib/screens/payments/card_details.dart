import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
class PaymentDetails extends StatefulWidget {
  String userID;
  PaymentDetails({Key? key,required this.userID}) : super(key: key);
  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  TextEditingController nameController=TextEditingController();
  TextEditingController expiryDateController=TextEditingController();
  TextEditingController CVVController=TextEditingController();
  TextEditingController cardNumberController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  bool showPassword = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Card Details"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 15, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 35,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                    ],
                    keyboardType: TextInputType.phone,
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                    controller: cardNumberController,
                    validator: (value) {
                      if ((value == null || value.isEmpty)) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    // obscureText: isPasswordTextField ,//? false : showPassword  ,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: "Card Number",
                      labelStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter,
                          LengthLimitingTextInputFormatter(5),
                        ],
                        keyboardType: TextInputType.phone,
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                        controller: expiryDateController,
                        validator: (value) {
                          if ((value == null || value.isEmpty)) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        // obscureText: isPasswordTextField ,//? false : showPassword  ,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 3),
                          labelText: "Expiry Date",
                          labelStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.1,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        keyboardType: TextInputType.phone,
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                        controller: CVVController,
                        validator: (value) {
                          if ((value == null || value.isEmpty)) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        // obscureText: isPasswordTextField ,//? false : showPassword  ,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 3),
                          labelText: "CVV",
                          labelStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.04,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.4,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                    controller: nameController,
                    validator: (value) {
                      if ((value == null || value.isEmpty)) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    // obscureText: isPasswordTextField ,//? false : showPassword  ,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: "Name",
                      labelStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () async{
                        if (_formKey.currentState!.validate()){
                  //        register(nameController.text, emailController.text,mobileController.text, passwordController.text,selectedUserType!);
                        }

                      },
                      color: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    ),

                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // register(String Name,String Email,String phone, String password, String selectedValue) async{
  //   String userType="2";
  //   if(selectedValue=='Buyer'){
  //     setState(() {
  //       userType="1";
  //     });
  //   }
  //   var params={
  //     "user_name":Name,
  //     "user_email":Email,
  //     "user_phone":phone,
  //     "user_password":password,
  //     "user_type":userType
  //   };
  //   var response=await http.post(
  //       Uri.parse(registeration)
  //           .replace(queryParameters: params)
  //   );
  //   if(response.statusCode==200)
  //   {var json=jsonDecode(response.body);
  //   if(json["status"]=="2") {
  //     Navigator.pushReplacement(context,
  //         MaterialPageRoute(builder: (context){
  //           return Login();
  //         }
  //         )
  //     );
  //     // print("SUccess");
  //     return true;
  //   }
  //   else
  //   {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text("User Already Registered !!")));
  //     return false;
  //   }
  //   }
  //   ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text("Please Try After Some Time !!")));
  //   return false;
  // }
}
