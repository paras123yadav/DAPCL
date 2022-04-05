import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class addProduct extends StatefulWidget {
  const addProduct({Key? key}) : super(key: key);

  @override
  State<addProduct> createState() => _addProductState();
}

class _addProductState extends State<addProduct> {
  File? _profilePic;
  Future<void> takeMedia() async {
    final XFile? media = await ImagePicker().pickImage(source: ImageSource.gallery, maxHeight: 720, maxWidth: 720);
    if (media != null) {
      setState(() {
        _profilePic = File(media.path);
      });
    }
  }
  String? Unit;
  final List<String> unitList = [
    "Kg",
    "g",
    "ml",
    "L",
  ];
  final _formKey = GlobalKey<FormState>();
  TextEditingController productName= TextEditingController();
  TextEditingController productQuantity= TextEditingController();
  TextEditingController productUnit= TextEditingController();
  TextEditingController productMrp= TextEditingController();
  TextEditingController productDescription= TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
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
                buildTextField("Product Name",0.8,productName),
                Row(
                  children: [
                    buildTextField("Quantity",0.4,productQuantity),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.2,
                    ),
                    // buildTextField("Unit",0.4,productUnit),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(10)),

                      // dropdown below..
                      child: DropdownButton<String>(
                        hint: Text("Unit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                        value: Unit,
                        onChanged: (String? newValue) =>
                            setState(() => Unit = newValue),
                        items: unitList
                            .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                            ))
                            .toList(),

                        // add extra sugar..
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 42,
                        underline: SizedBox(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    buildTextField("MRP (Rs.)",0.4,productMrp),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.4,
                    ),
                  ],
                ),
                TextFormField(
                  minLines: 5,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "Description....",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.shade500,
                          width: 1.5),
                        borderRadius: BorderRadius.circular(20 )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20 )
                    )
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.025,
                ),
                // InkWell(
                //   onTap: (){
                //     setState(() {
                //       _profilePic=null;
                //     });
                //   },
                //   child: Container(
                //     height: 40,
                //     width: 40,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       border: Border.all(
                //         width: 4,
                //         color: Theme.of(context).scaffoldBackgroundColor,
                //       ),
                //       color: Colors.red,
                //     ),
                //     child: Icon(
                //       Icons.close,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Add Product Image",style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                    ),),

                    _profilePic==null?IconButton(onPressed: (){
                      takeMedia();
                    }, icon: Icon(Icons.camera_alt_rounded,size: 30,)):
                    InkWell(
                      onTap: (){
                        takeMedia();
                      },
                      child: Container(
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

                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(_profilePic!))),
                      ),
                    ),
                  ],
                ),

                // buildTextField("Description",0.8,productDescription),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.05,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(

                      onPressed: () async{
                        // if (_formKey.currentState!.validate()){
                        //   register(nameController.text, emailController.text,mobileController.text, passwordController.text);
                        // }

                      },
                      color: Colors.green,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width*0.2),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "Add Product",
                        style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildTextField(
      String labelText,double size,TextEditingController currcntrlr) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*size,
        child: TextFormField(

          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
          controller: currcntrlr,
          validator: (value) {
            if ((value == null || value.isEmpty)) {
              return 'Please enter some text';
            }
            return null;
          },
          // obscureText: isPasswordTextField ,//? false : showPassword  ,
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
}

