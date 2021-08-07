import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Center(
        child: CupertinoActivityIndicator(radius: 17),
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
