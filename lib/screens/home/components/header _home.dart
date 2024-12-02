import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return FadeInUp(
      delay: Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(
                    text: "Find your ",
                    style: theme.displayLarge,
                    children: [
                  TextSpan(
                    text: "Style",
                    style: theme.displayLarge?.copyWith(
                        color: primaryColor,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  )
                ])),
            RichText(
                text: TextSpan(
                    text: "Be more beautiful with our ",
                    style: theme.displayLarge?.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                    children: [
                  TextSpan(
                    text: "suggestion :)",
                  )
                ])),
          ],
        ),
      ),
    );
  }
}
