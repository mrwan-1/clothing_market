import 'package:clothing_market/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/base_model.dart';

class Details extends StatefulWidget {
  const Details(
      {super.key, required this.data, required this.isComeFromMostPopulart});
  final BaseModel data;
  final bool isComeFromMostPopulart;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    BaseModel curent = widget.data;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SizedBox(
        width: size.height,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.5,
              child: Hero(
                tag:
                    widget.isComeFromMostPopulart ? curent.imageUrl : curent.id,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(curent.imageUrl),
                          fit: BoxFit.cover)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ))
      ],
      leading: IconButton(
          onPressed: () {
            Get.off(Home());
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
    );
  }
}
