import 'package:flutter/material.dart';

import '../../components/appbar.dart';
import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CommonAppBar("Sign Up"),
        body: Body(),
      ),
    );
  }
}
