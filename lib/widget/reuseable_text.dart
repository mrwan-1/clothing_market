import 'package:flutter/material.dart';

class ReUseableTextForDeatils extends StatelessWidget {
  const ReUseableTextForDeatils({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;

    return RichText(
      text: TextSpan(
          text: "\$",
          style: theme.titleSmall?.copyWith(
              color: Colors.lightGreen[400],
              fontSize: 21,
              fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: text,
              style: theme.titleSmall?.copyWith(
                  // color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ]),
    );
  }
}
