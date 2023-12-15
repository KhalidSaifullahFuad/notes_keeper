import 'package:flutter/material.dart';

void showMyDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return const AlertDialog(
        backgroundColor: Colors.transparent,
        content: Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
  );
}
