import 'package:flutter/material.dart';
import 'package:spacex_latest_launch/services/constants.dart';

class DetailTextItem extends StatelessWidget {
  final String title;
  final String text;
  final bool isStatus;
  final bool? status;

  const DetailTextItem({
    Key? key,
    required this.text,
    required this.title,
    this.isStatus = false,
    this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: kDetailNameTextStyle,
          ),
          TextSpan(
            text: text,
            style: !isStatus
                ? kDetailTextStyle
                : kDetailTextStyle.copyWith(
                    color: status! ? Colors.green : Colors.red),
          )
        ],
      ),
    );
  }
}
