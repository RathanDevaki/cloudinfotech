// @dart=2.9
//import 'dart:developer';

import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinfotech/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Models/user_model.dart';
import 'screens/dashboard.dart';
//import 'package:fluttertoast/fluttertoast.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Cloud Infotech',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyLoginPage(),
//     );
//   }
// }

class MyLoginPage extends StatefulWidget {
  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  static var successSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Success!',
      message: 'Login successful!',
      contentType: ContentType.success,
    ),
  );

  static var failureSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Oh Snap!',
      message: 'Login Failed.\nPlease try again!',
      contentType: ContentType.failure,
    ),
  );

  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String email, password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Text("Sign In",
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w800,
                  color: Colors.black)),
        ),
        body: SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: showProgress,
            child: Center(
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.manual,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Text(
                      //   "Login Page",
                      //   style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
                      // ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value; // get value from TextField
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        obscureText: true,
                        onChanged: (value) {
                          password = value; //get value from textField
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            showProgress = true;
                          });

                          try {
                            await _auth
                                .createUserWithEmailAndPassword(
                                    email: email, password: password)
                                .then((value) => postDetails())
                                .catchError((e) {
                              log(e.toString());
                            });
                          } catch (e) {
                            log(e.toString());
                          }

                          try {
                            final newUser =
                                await _auth.signInWithEmailAndPassword(
                                    email: email, password: password);

                            print(newUser.toString());

                            if (newUser != null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(successSnackBar);
                              setState(() {
                                showProgress = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Dashboard(),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(failureSnackBar);
                            setState(() {
                              showProgress = false;
                            });
                          }
                        },
                        child: Container(
                          height: 60.0,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: themeBlue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: Center(
                            child: Text('Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(context, '/signup'),
                          child: Text('Don\'t have an account?',
                              style: TextStyle(
                                  color: Color(0xFF653bbf),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0)),
                        ),
                      ),
                      const SizedBox(height: 50.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 80, height: 1.0, color: Colors.black12),
                          const SizedBox(width: 20.0),
                          Text('OR',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0)),
                          const SizedBox(width: 20.0),
                          Container(
                              width: 80, height: 1.0, color: Colors.black12),
                        ],
                      ),
                      const SizedBox(height: 50.0),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                                height: 60.0,
                                width: size.width / 2 - 40,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/icons/google.png",
                                          width: 20.0),
                                      const SizedBox(width: 15.0),
                                      Text("Google",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0)),
                                    ],
                                  ),
                                )),
                          ),
                          const SizedBox(width: 20.0),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                                height: 60.0,
                                width: size.width / 2 - 40,
                                decoration: BoxDecoration(
                                    color: Color(0xFF4267B2),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/icons/facebook.png",
                                          width: 20.0),
                                      const SizedBox(width: 15.0),
                                      Text("Facebook",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15.0)),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  postDetails() async {
    log('inside post');
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User user = _auth.currentUser;
    UserModel _userModel = UserModel();
    String em = _userModel.email = user.email;
    String n = _userModel.name = "Rathane";
    // _userModel.password = "12345678";
    String u = _userModel.uid = user.uid;

    // _userModel.
    log('Datas:- $em ,$n ,$u ');
    await firestore.collection("users").doc(user.uid).set(_userModel.toMap());
  }
}
