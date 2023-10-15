import 'package:flutter/material.dart';

PreferredSizeWidget CommonAppBar(String text) {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 37, 31, 211),
    elevation: 0,
    title: Text(
      text,
      style: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.grey),
    ),
  );
}
