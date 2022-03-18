

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
          child: ListView(
            children: [
              Center(
                child: Stack(
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
                              image: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
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
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
               Row(
                  children: [
                    buildTextField("First Name", "Dor", false,0.4),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.1,
                    ),
                    buildTextField("Last Name", "Alex", false,.4),
                  ],
                ),
              buildTextField("E-mail", "alexd@gmail.com", false,0.9),
              buildTextField("Password", "********", true,0.9),
              Row(
                children: [
                  buildTextField("Mobile", "1234567890", false,0.4),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.1,
                  ),
                  buildTextField("Pincode", "TLV, Israel", false,0.4),
                ],
              ),
              buildTextField("Address", "TLV, Israel", false,0.9),
              SizedBox(
                width: MediaQuery.of(context).size.width*.9,
                child: Row(
                  children: [
                    buildTextField("City", "TLV, Israel", false,0.4),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.1,
                    ),
                    buildTextField("State", "TLV, Israel", false,0.4),
                  ],
                ),
              ),


              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField,double size) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*size,
        child: TextField(
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
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeholder,
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
        ),
      ),
    );
  }

}
