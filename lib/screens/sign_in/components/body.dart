import 'package:cloudinfotech/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import '../../../helper/size_config.dart';
import '../../sign_up/sign_up_screen.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                // Text(
                //   "Welcome Back",
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: getProportionateScreenWidth(28),
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SocalCard(
                //       icon: "assets/icons/google-icon.svg",
                //       press: () {},
                //     ),
                //     SocalCard(
                //       icon: "assets/icons/facebook-2.svg",
                //       press: () {},
                //     ),
                //     SocalCard(
                //       icon: "assets/icons/twitter.svg",
                //       press: () {},
                //     ),
                //   ],
                // ),
                SizedBox(height: getProportionateScreenHeight(20)),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/signup'),
                  child: Center(
                    child: Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                          color: Color(0xFF653bbf),
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 80, height: 1.0, color: Colors.black12),
                    const SizedBox(width: 20.0),
                    Text('OR',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0)),
                    const SizedBox(width: 20.0),
                    Container(width: 80, height: 1.0, color: Colors.black12),
                  ],
                ),
                const SizedBox(height: 20.0),
                Center(
                  child: Row(
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
                              border:
                                  Border.all(width: 0.5, color: Colors.grey),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
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
                ),
                // NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
