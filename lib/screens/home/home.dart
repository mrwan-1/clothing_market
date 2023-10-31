import 'package:animate_do/animate_do.dart';
import 'package:clothing_market/screens/home/components/body_The_Home.dart';
import 'package:flutter/material.dart';
import 'components/Categories.dart';
import 'components/header _home.dart';
import 'components/most_Popluer_content.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //top tow text
              HeaderHome()
              //Categories
              ,
              Categories(),
              //body
              BodyTheHome(),
              //Most Popluer content

              FadeInUp(
                delay: Duration(milliseconds: 650),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Most Popluer',
                        style: theme.headline3,
                      ),
                      Text(
                        'See All',
                        style: theme.headline4,
                      ),
                    ],
                  ),
                ),
              ),
              MostPopluerContent(),
            ],
          ),
        ),
      ),
    );
  }
}
