import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ngo/screens/login/login.dart';
import 'dart:convert';

import '../../api/constant.dart';
import '../models/User.dart';
class ProfilePage extends StatefulWidget {
  final String phone, password;
  const ProfilePage({Key? key,required this.phone,required this.password}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}


class _ProfilePageState extends State<ProfilePage> {


  @override
  void initState() {
    super.initState();
    FetchUserInfo(widget.phone, widget.password);
  }


  TextEditingController emailController=TextEditingController();
  TextEditingController userController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
  TextEditingController pinController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController stateController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _profilePic=File("assets/noimage.png");
  late List<UserDetails> userDetail;

  FetchUserInfo(String phone, String password) async {
    //print("ppppppp1");
    var params={"user_email":phone,
      "user_password":password
    };
    var response=await http.post(
        Uri.parse(validateUser)
            .replace(queryParameters: params)
    );
    if(response.statusCode==200)
      //print("ppppppp2");
    {var json=jsonDecode(response.body);
    //print("ppppppp4");
    var data=LoginInfo.fromJson(json);
    //print("ppppppp5");
    if(json["status"]=="1") {
      setState(() {
        if(data.data!=null){
     //     print("ppppppp3");
          userDetail=data.data;
          nameController.text=userDetail[0].userName!;
          emailController.text=userDetail[0].userEmail!;
          passwordController.text=userDetail[0].userPassword!;
          mobileController.text=userDetail[0].userPhone!;
          if(userDetail[0].userType=="1"){
            userController.text="Buyer";
          }
          else{
            userController.text="Seller";
          }
        }
      });
      //print("adaas");
      print(userDetail[0].userName);
      // print("SUccess");

    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid credentials !!")));

    }
    }
  }

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
                buildTextField("Name", false,0.4,true,nameController,false),
                buildTextField("E-mail", false,0.9,true,emailController,false),
                buildTextField("UserType", false,0.9,true,userController,false),
                Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.78,
                        child: buildTextField("Password",showPassword,0.65,false,passwordController,false)
                    ),
                    IconButton(
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
                  ],
                ),
                Row(
                  children: [
                    buildTextField("Mobile", false,0.4,true,mobileController,false),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.1,
                    ),
                    buildTextField("Pincode", false,0.4,false,pinController,true),
                  ],
                ),
                buildTextField("Address", false,0.9,false,addressController,true),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.9,
                  child: Row(
                    children: [
                      buildTextField("City", false,0.4,false,cityController,true),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.1,
                      ),
                      buildTextField("State",false,0.4,false,stateController,true),
                    ],
                  ),
                ),


                SizedBox(
                  height: MediaQuery.of(context).size.height*0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // RaisedButton(
                    //   color: Colors.grey.shade300,
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: MediaQuery.of(context).size.width*0.09),
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(20)),
                    //   onPressed: () {
                    //     Navigator.pushReplacement(context,
                    //         MaterialPageRoute(builder: (context){
                    //           return Login();
                    //         }
                    //         )
                    //     );
                    //   },
                    //   child: Text("Cancel",
                    //       style: TextStyle(
                    //           fontSize: 16,
                    //           letterSpacing: 2.2,
                    //           color: Colors.black)),
                    // ),
                    RaisedButton(
                      onPressed: () async{
                        // if (_formKey.currentState!.validate()){
                        //   register(nameController.text, emailController.text,mobileController.text, passwordController.text);
                        // }
                        FetchUserInfo(widget.phone, widget.password);

                      },
                      color: Colors.green,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width*0.2),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "Save",
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

  Widget buildTextField(
      String labelText, bool isPasswordTextField,double size,bool a,TextEditingController currcntrlr, bool val) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*size,
        child: TextFormField(
          enabled: val,
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
          controller: currcntrlr,
          validator: (value) {
            if ((value == null || value.isEmpty) && a==true) {
              return 'Please enter some text';
            }
            return null;
          },
          obscureText: isPasswordTextField ,//? false : showPassword  ,
          decoration: InputDecoration(
            // suffixIcon: isPasswordTextField
            //     ? IconButton(
            //   onPressed: () {
            //     setState(() {
            //       showPassword = !showPassword;
            //     });
            //   },
            //   icon: Icon(
            //     Icons.remove_red_eye,
            //     color: Colors.grey,
            //   ),
            // )
            //     : null,
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
  register(String Name,String Email,String phone, String password) async{
    var params={
      "user_name":Name,
      "user_email":Email,
      "user_phone":phone,
      "user_password":password,

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
  initialize() async{
    emailController=TextEditingController(text: userDetail[0].userEmail);
    passwordController=TextEditingController(text: userDetail[0].userPassword);
    nameController=TextEditingController(text: userDetail[0].userName);
    mobileController=TextEditingController(text: userDetail[0].userPhone);
    pinController=TextEditingController();
    addressController=TextEditingController();
    cityController=TextEditingController();
    stateController=TextEditingController();
  }
}