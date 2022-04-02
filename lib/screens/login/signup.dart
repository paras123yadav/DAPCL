import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ngo/CustomWidget/input_widgets.dart';
import 'package:ngo/screens/login/login.dart';
import 'dart:convert';

import '../../api/constant.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
  TextEditingController pinController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController stateController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _profilePic=File("assets/noimage.png");
  String? selectedUserType;
  final List<String> userType = [
    "Buyer",
    "Seller"
  ];
  Future<void> takeMedia() async {
    final XFile? media = await ImagePicker().pickImage(source: ImageSource.gallery, maxHeight: 720, maxWidth: 720);
    if (media != null) {
      setState(() {
        _profilePic = File(media.path);
      });
    }
  }
  @override
  bool showPassword = false;
  Widget build(BuildContext context) {
    return Scaffold(
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
                Center(
                  child: Column(
                    children: [
                      Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context).scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 10))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(_profilePic!))),
                        ),
                        Positioned(
                            bottom: -4,
                            right: -4,
                            child: InkWell(
                              onTap: ()async{
                                takeMedia();
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 4,
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                  ),
                                  color: Colors.green,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        Positioned(
                            bottom: -4,
                            left: -4,
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  _profilePic=File("assets/noimage.png");
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 4,
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                  ),
                                  color: Colors.red,
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ],
                    ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                buildTextField("Name", false,0.4,true,nameController),
                buildTextField("E-mail", false,0.9,true,emailController),
                buildTextField("Password", true,0.9,true,passwordController),
                Row(
                  children: [
                    buildTextField("Mobile", false,0.4,true,mobileController),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.1,
                    ),
                    buildTextField("Pincode", false,0.4,false,pinController),
                  ],
                ),
                buildTextField("Address", false,0.9,false,addressController),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.9,
                  child: Row(
                    children: [
                      buildTextField("City", false,0.4,false,cityController),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.1,
                      ),
                      buildTextField("State",false,0.4,false,stateController),
                    ],
                  ),
                ),
                Row(
                    children: [
                      Text("Select the type of User",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Colors.black54),),
                      SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white, borderRadius: BorderRadius.circular(10)),

                        // dropdown below..
                        child: DropdownButton<String>(
                          value: selectedUserType,
                          onChanged: (String? newValue) =>
                              setState(() => selectedUserType = newValue),
                          items: userType
                              .map<DropdownMenuItem<String>>(
                                  (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,style: TextStyle(fontSize: 18)),
                              ))
                              .toList(),

                          // add extra sugar..
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 42,
                          underline: SizedBox(),
                        ),
                      ),
                    ]
                ),


                SizedBox(
                  height: MediaQuery.of(context).size.height*0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      color: Colors.grey.shade300,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context){
                              return Login();
                            }
                            )
                        );
                      },
                      child: Text("CANCEL",
                          style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2.2,
                              color: Colors.black)),
                    ),
                    RaisedButton(
                      onPressed: () async{
                        if (_formKey.currentState!.validate()){
                          register(nameController.text, emailController.text,mobileController.text, passwordController.text,selectedUserType!);
                        }

                      },
                      color: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 16,
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

  Widget buildTextField(
      String labelText, bool isPasswordTextField,double size,bool a,TextEditingController currcntrlr) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*size,
        child: TextFormField(
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
          controller: currcntrlr,
          validator: (value) {
            if ((value == null || value.isEmpty) && a==true) {
              return 'Please enter some text';
            }
            return null;
          },
          obscureText: isPasswordTextField ? showPassword : false,
          decoration: InputDecoration(
              suffixIcon: isPasswordTextField
                  ? IconButton(
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
                icon: Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ),
              )
                  : null,
              contentPadding: EdgeInsets.only(bottom: 3),
              labelText: labelText,
              labelStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
        ),
      ),
    );
  }
  register(String Name,String Email,String phone, String password, String selectedValue) async{
    String userType="2";
    if(selectedValue=='Buyer'){
      setState(() {
        userType="1";
      });
    }
    var params={
      "user_name":Name,
      "user_email":Email,
      "user_phone":phone,
      "user_password":password,
      "user_type":userType
    };
    var response=await http.post(
        Uri.parse(registeration)
            .replace(queryParameters: params)
    );
    if(response.statusCode==200)
    {var json=jsonDecode(response.body);
    if(json["status"]=="2") {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context){
            return Login();
          }
          )
      );
      // print("SUccess");
      return true;
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid credentials !!")));
      return false;
    }
    }
    return false;
  }
}
/*
"user_password:harry4415@1
user_email:ayush.filmitics@gmail.com
*/