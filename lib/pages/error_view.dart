import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 45,
          ),
          SizedBox(height: 10),
          Text(
            "Something went wrong!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      )),
    );
  }
}
