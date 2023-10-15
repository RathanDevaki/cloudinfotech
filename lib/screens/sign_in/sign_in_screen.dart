import 'package:flutter/material.dart';

import '../../components/appbar.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CommonAppBar("Sign-in"),
        body: Body(),
      ),
    );
  }
}
