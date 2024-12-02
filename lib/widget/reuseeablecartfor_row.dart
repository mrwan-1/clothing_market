import 'package:clothing_market/widget/reuseable_text.dart';
import 'package:flutter/material.dart';

class ReuseAbleCartForRow extends StatelessWidget {
  const ReuseAbleCartForRow(
      {super.key, required this.text, required this.price});
  final String text;
  final double price;

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: theme.headlineSmall?.copyWith(fontSize: 16, color: Colors.grey),
          ),
          ReUseableTextForDeatils(text: price.toString())
        ],
      ),
    );
  }
}
