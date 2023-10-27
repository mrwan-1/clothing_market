import 'package:animate_do/animate_do.dart';
import 'package:clothing_market/data/app_data.dart';
import 'package:clothing_market/model/categories_model.dart';
import 'package:clothing_market/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/base_model.dart';
import 'detail.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 2, viewportFraction: 0.7);

    super.initState();
    // TODO: implement initState
  }

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
              //body
              FadeInUp(
                delay: Duration(milliseconds: 550),
                child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: size.width,
                    height: size.height * 0.45,
                    // color: Colors.red,
                    child: PageView.builder(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: mainList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () => Get.to(Details(
                                  data: mainList[index],
                                  isComeFromMostPopulart: false,
                                )),
                            child: view(index, theme, size));
                      },
                    )),
              ),
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
              //Most Popluer content
              FadeInUp(
                delay: Duration(milliseconds: 750),
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.44,
                  // color: Colors.lightBlue,
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: mainList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.63, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      BaseModel current = mainList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(Details(
                            data: mainList[index],
                            isComeFromMostPopulart: true,
                          ));
                          // Navigator.push(context, MaterialPageRoute(
                          //   builder: (context) {
                          //     return Details(
                          //         data: mainList[index],
                          //         isComeFromMostPopulart: true);
                          //   },
                          // ));
                        },
                        child: Column(
                          children: [
                            Hero(
                              tag: current.imageUrl,
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                width: size.width * 0.5,
                                height: size.height * 0.3,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(current.imageUrl),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4,
                                        offset: Offset(0, 4),
                                        color: Color.fromARGB(61, 0, 0, 0),
                                      ),
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(
                                current.name,
                                style: theme.headline2,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "\$",
                                  style: theme.subtitle2?.copyWith(
                                      color: Colors.lightGreen[400],
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                      text: current.price.toString(),
                                      style: theme.subtitle2?.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget view(int index, TextTheme theme, Size size) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double value = 0.0;

        if (_controller.position.haveDimensions) {
          value = index.toDouble() - (_controller.page ?? 0);
          value = (value * 0.04).clamp(-1, 1);
        }
        return Transform.rotate(
          angle: 3.14 * value,
          child: _buildCard(size, mainList[index], theme),
        );
      },
    );
  }

  Widget _buildCard(Size size, BaseModel data, TextTheme theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Hero(
            tag: data.id,
            child: Container(
              width: size.width * 0.6,
              height: size.height * 0.35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                      image: AssetImage(data.imageUrl), fit: BoxFit.cover),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 4),
                        color: Color.fromARGB(60, 0, 0, 0),
                        blurRadius: 4)
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              data.name,
              style: theme.headline2,
            ),
          ),
          RichText(
            text: TextSpan(
                text: "\$",
                style: theme.headline2?.copyWith(
                    color: Colors.lightGreen[400],
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: data.price.toString(),
                    style: theme.headline2?.copyWith(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
