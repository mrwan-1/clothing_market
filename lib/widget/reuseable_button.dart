import 'package:flutter/material.dart';

class ReUseAbleButton extends StatelessWidget {
  const ReUseAbleButton({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: MaterialButton(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 2,
        minWidth: size.width * 0.9,
        height: size.height * 0.07,
        color: Color(0xff141414),
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
