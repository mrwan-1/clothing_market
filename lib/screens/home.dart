import 'package:animate_do/animate_do.dart';
import 'package:clothing_market/data/app_data.dart';
import 'package:clothing_market/model/categories_model.dart';
import 'package:clothing_market/utils/constants.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //top tow text
              FadeInUp(
                delay: Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Find your ",
                              style: theme.headline1,
                              children: [
                            TextSpan(
                              text: "Style",
                              style: theme.headline1?.copyWith(
                                  color: primaryColor,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold),
                            )
                          ])),
                      RichText(
                          text: TextSpan(
                              text: "Be more beautiful with our ",
                              style: theme.headline1?.copyWith(
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
              )
              //Categories
              ,
              FadeInUp(
                delay: const Duration(milliseconds: 45),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: size.width,
                  height: size.height * 0.13,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (ctx, index) {
                      CategoriesModel curent = categories[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(curent.imageUrl),
                            ),
                            SizedBox(
                              height: size.height * 0.008,
                            ),
                            Text(
                              curent.title,
                              style: theme.subtitle1,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
