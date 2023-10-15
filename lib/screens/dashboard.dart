//import 'dart:developer';
import 'package:cloudinfotech/login.dart';
import 'package:cloudinfotech/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../components/appbar.dart';
import 'gst_operation.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar("Dashboard"),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem("Items Cost", 1, Icons.currency_rupee),
            makeDashboardItem(
                "GST Opeations", 2, Icons.currency_exchange_outlined),
            makeDashboardItem("Items to Order", 3, Icons.grading),
            makeDashboardItem("Daily Expense", 4, Icons.wallet),
            makeDashboardItem("Invoice & Receipt", 5, Icons.receipt_long),
            makeDashboardItem("Profile", 6, Icons.account_balance_outlined)
          ],
        ),
      ),
    );
  }

  Card makeDashboardItem(String title, int id, IconData icon) {
    return Card(
      elevation: 1.0,
      margin: const EdgeInsets.all(14.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Neumorphic(
        style: NeumorphicStyle(
            shadowLightColor: Colors.black,
            shape: NeumorphicShape.concave,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: 5,
            lightSource: LightSource.bottomRight,
            color: Colors.white10),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            if (id == 2) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GstOperation(),
                ),
              );
            } else if (id == 3) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            }
            // else if (id == 3) {
            //   Navigator.of(context)
            //       .push(MaterialPageRoute(builder: (context) => BookMeal()));
            // }
            else if (id == 4) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyLoginPage()));
            }
            // else if (id == 5) {
            //   Navigator.of(context)
            //       .push(MaterialPageRoute(builder: (context) => Message()));
            // } else if (id == 6) {
            //   Navigator.of(context).push(
            //       MaterialPageRoute(builder: (context) => ProfileScreen()));
            // }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              const SizedBox(height: 50.0),
              Center(
                  child: Icon(
                icon,
                size: 40.0,
                color: Colors.black,
              )),
              const SizedBox(height: 20.0),
              Center(
                child: Text(title,
                    style:
                        const TextStyle(fontSize: 18.0, color: Colors.black)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
