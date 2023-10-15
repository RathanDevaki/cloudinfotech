// @dart=2.9
import 'dart:developer';

import 'package:cloudinfotech/screens/dashboard.dart';
import 'package:cloudinfotech/screens/sign_up/sign_up_screen.dart';
import 'package:cloudinfotech/helper/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'components/appbar.dart';
import 'firebase_options.dart';
import 'login.dart';
import 'screens/sign_in/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => MyHomePage(),
        '/signup': (context) => SignUpScreen(),
        '/signin': (context) => SignInScreen(),
        '/dashboard': (context) => Dashboard(),
      },
      debugShowCheckedModeBanner: false,
      // home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final _auth = FirebaseAuth.instance;

  bool showProgress = false;
  String email, password;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Center(
        child: SignInScreen(),
      ),
      // Center(
      //   child: ModalProgressHUD(
      //     inAsyncCall: showProgress,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         const Text(
      //           "Registration Page",
      //           style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
      //         ),
      //         const SizedBox(
      //           height: 20.0,
      //         ),
      //         TextField(
      //           keyboardType: TextInputType.emailAddress,
      //           textAlign: TextAlign.center,
      //           onChanged: (value) {
      //             email = value; //get the value entered by user.
      //           },
      //           decoration: const InputDecoration(
      //               hintText: "Enter your Email",
      //               border: OutlineInputBorder(
      //                   borderRadius: BorderRadius.all(Radius.circular(32.0)))),
      //         ),
      //         const SizedBox(
      //           height: 20.0,
      //         ),
      //         TextField(
      //           obscureText: true,
      //           textAlign: TextAlign.center,
      //           onChanged: (value) {
      //             password = value; //get the value entered by user.
      //           },
      //           decoration: const InputDecoration(
      //               hintText: "Enter your Password",
      //               border: OutlineInputBorder(
      //                   borderRadius: BorderRadius.all(Radius.circular(32.0)))),
      //         ),
      //         const SizedBox(
      //           height: 20.0,
      //         ),
      //         Material(
      //           elevation: 5,
      //           color: Colors.lightBlue,
      //           borderRadius: BorderRadius.circular(32.0),
      //           child: MaterialButton(
      //             onPressed: () async {
      //               setState(() {
      //                 showProgress = true;
      //               });
      //               try {
      //                 final newuser =
      //                     await _auth.createUserWithEmailAndPassword(
      //                         email: email, password: password);
      //                 if (newuser != null) {
      //                   log('done');
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => MyLoginPage()),
      //                   );
      //                   setState(() {
      //                     showProgress = false;
      //                   });
      //                 }
      //               } catch (e) {}
      //             },
      //             minWidth: 200.0,
      //             height: 45.0,
      //             child: const Text(
      //               "Register",
      //               style:
      //                   TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
      //             ),
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 15.0,
      //         ),
      //         GestureDetector(
      //           onTap: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => Dashboard()),
      //             );
      //           },
      //           child: const Text(
      //             "Already Registred? Login Now",
      //             style: TextStyle(
      //                 color: Colors.blue, fontWeight: FontWeight.w900),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
//time < timestamp.date(2022, 8, 10)
