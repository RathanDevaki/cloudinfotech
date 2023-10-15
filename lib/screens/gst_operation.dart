import 'dart:developer';

import 'package:flutter/material.dart';

import '../components/appbar.dart';

class GstOperation extends StatefulWidget {
  const GstOperation({super.key});

  @override
  State<GstOperation> createState() => _GstOperationState();
}

class _GstOperationState extends State<GstOperation> {
  @override
  Widget build(BuildContext context) {
    TextEditingController amount = TextEditingController();
    TextEditingController tax = TextEditingController();
    double _tax = 0, _amt = 0;
    String data = '';
    return Scaffold(
      appBar: CommonAppBar("GST Operations"),
      body: Center(
          // child: Column(
          //   mainAxisSize: MainAxisSize.max,
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          //       child: Container(
          //         width: 200,
          //         child: Card(
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(15.0),
          //           ),
          //           color: Color.fromARGB(255, 230, 232, 237),
          //           elevation: 10,
          //           child: Column(
          //             mainAxisSize: MainAxisSize.min,
          //             children: <Widget>[
          //               Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Text(
          //                   'Include GST',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w600,
          //                     color: Color.fromARGB(255, 37, 36, 36),
          //                   ),
          //                 ),
          //               ),
          //               // Padding(
          //               //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //               //   // child: Row(
          //               //   //   mainAxisSize: MainAxisSize.min,
          //               //   //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               //   //   children: [
          //               //   //     Flexible(
          //               //   //       fit: FlexFit.loose,
          //               //   //       child: TextFormField(
          //               //   //         controller: amount,
          //               //   //         decoration: InputDecoration(
          //               //   //           label: Text('Enter amount'),
          //               //   //         ),
          //               //   //       ),
          //               //   //     ),
          //               //   //     Spacer(),
          //               //   //     Text(data),
          //               //   //     Flexible(
          //               //   //       fit: FlexFit.tight,
          //               //   //       child: TextFormField(
          //               //   //         controller: tax,
          //               //   //         decoration: InputDecoration(
          //               //   //             label: Text('Enter GST'), suffixText: '%'),
          //               //   //       ),
          //               //   //     ),
          //               //   //   ],
          //               //   // ),
          //               // ),
          //               // ButtonBar(
          //               //   children: <Widget>[
          //               //     ElevatedButton(
          //               //       child: const Text('Submit',
          //               //           style: TextStyle(color: Colors.white)),
          //               //       onPressed: () {
          //               //         _amt = double.parse(amount.text);
          //               //         _tax = double.parse(tax.text);
          //               //         double res = (_amt * _tax) / 100;
          //               //         setState(() {
          //               //           data = res.toString();
          //               //         });
          //               //       },
          //               //     ),
          //               //   ],
          //               // ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //     Container(
          //       child: Text(
          //         'GST Seperator',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontStyle: FontStyle.italic,
          //         ),
          //       ),
          //       width: 100,
          //       height: 100,
          //       decoration: BoxDecoration(
          //         color: Theme.of(context).secondaryHeaderColor,
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}
