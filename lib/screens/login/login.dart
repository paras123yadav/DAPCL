import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ngo/CustomWidget/background.dart';
import 'package:ngo/api/constant.dart';
import 'package:ngo/main.dart';
import 'package:ngo/screens/login/ForgetPasswordPhoneInput.dart';
import 'package:ngo/screens/login/otp.dart';
import 'package:ngo/screens/login/phone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String email;

  late String password;

  bool showPassword = true;

  bool isPasswordTextField = true;
  Color _iconColor = Colors.grey;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool a = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.121),
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 4, color: Theme.of(context).scaffoldBackgroundColor),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 10))
                ],
                shape: BoxShape.circle,
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                    ))),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const Text(
            "Login",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              cursorHeight: 22,
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              // onChanged: (value) {
              //   email = value;
              // },
              decoration: const InputDecoration(
                hintStyle: TextStyle(fontSize: 20),
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(),
                // labelText: 'Email',
                hintText: 'Email',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              autofocus: false,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              controller: passwordController,
              obscureText: showPassword,
              cursorHeight: 22,
              // onChanged: (value) {
              //   password = value;
              // },
              decoration: InputDecoration(
                suffixIcon: isPasswordTextField
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword == true
                                ? _iconColor = Colors.black
                                : _iconColor = Colors.grey;
                            showPassword = !showPassword;
                            isPasswordTextField = !isPasswordTextField;
                          });
                        },
                        icon: Icon(
                          Icons.visibility_off,
                          color: _iconColor,
                        ),
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.visibility,
                          color: _iconColor,
                        ),
                        onPressed: () {
                          setState(() {
                            showPassword == true
                                ? _iconColor = Colors.black
                                : _iconColor = Colors.grey;
                            showPassword = !showPassword;
                            isPasswordTextField = !isPasswordTextField;
                          });
                        },
                      ),
                hintStyle: TextStyle(fontSize: 20),
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                // labelText: 'Password',
                hintText: 'Password',

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              autofocus: false,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => phoneInputPassword()));
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MaterialButton(
              minWidth: double.infinity,
              height: 55,
              onPressed: () async {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context){
                //       return const BottomNavigationBarController();
                //     }
                //     )
                // );
                // print(emailController.text+" "+passwordController.text);
                a = await verifyLogin(
                    emailController.text, passwordController.text);
                print(emailController.text);
              },
              color: Colors.green,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => phoneInput()));
            },
            child: const Text(
              "Login with OTP",
              style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Don't have an account? ",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<bool> verifyLogin(String phone, String password) async {
    var params = {"user_email": phone, "user_password": password};
    var response = await http
        .post(Uri.parse(validateUser).replace(queryParameters: params));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print("SUccess1");
      if (json["status"] == "1") {
        print("SUccess2");
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user_email', emailController.text);
        prefs.setString('user_password', passwordController.text);

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return BottomNavigationBarController(
              phone: phone, password: password);
        }));
        // print("SUccess");
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Invalid credentials !!")));
        return false;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please try after sometime!!")));
      return false;
    }
  }
}
