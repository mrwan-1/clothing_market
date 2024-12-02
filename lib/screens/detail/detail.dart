import 'package:animate_do/animate_do.dart';
import 'package:clothing_market/screens/cart/method/add_to_cart.dart';
import 'package:clothing_market/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../model/base_model.dart';
import '../../widget/reuseable_button.dart';
import '../../widget/reuseable_text.dart';

class Details extends StatefulWidget {
  const Details(
      {super.key, required this.data, required this.isComeFromMostPopulart});
  final BaseModel data;
  final bool isComeFromMostPopulart;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int selectedSize = 3;
  int selectedColor = 2;
  @override
  void dispose() {
    // TODO: implement dispose
    AddToCart();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    BaseModel current = widget.data;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SizedBox(
        width: size.height,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //prudect Image
            SizedBox(
              width: size.width,
              height: size.height * 0.5,
              child: Stack(
                children: [
                  Hero(
                    tag: widget.isComeFromMostPopulart
                        ? current.imageUrl
                        : current.id,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(current.imageUrl),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.12,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: gradient,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter)),
                    ),
                  )
                ],
              ),
            ),
            //  prudect Info
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            current.name,
                            style: theme.displaySmall?.copyWith(fontSize: 23),
                          ),
                          ReUseableTextForDeatils(
                            text: widget.data.price.toString(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.006,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: primaryColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            current.star.toString(),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${current.review} K + review',
                            style:
                                theme.headlineSmall?.copyWith(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 15,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Select Size
            FadeInUp(
              delay: const Duration(milliseconds: 400),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 18, bottom: 20),
                child: Text(
                  'Select Size',
                  style: theme.displaySmall?.copyWith(),
                ),
              ),
            ),
            //sizes
            FadeInUp(
              delay: const Duration(milliseconds: 500),
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.08,
                // color: Colors.red,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: sizes.length,
                  itemBuilder: (context, index) {
                    var currnt = sizes[index];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = index;
                        });
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.all(10),
                        width: size.width * 0.12,
                        duration: Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: selectedSize == index
                              ? primaryColor
                              : Colors.transparent,
                          border: Border.all(width: 2, color: primaryColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                            child: Text(
                          currnt,
                          style: TextStyle(
                              color: selectedSize == index
                                  ? Colors.white
                                  : Colors.black),
                        )),
                      ),
                    );
                  },
                ),
              ),
            )
            // Select Color
            ,
            FadeInUp(
              delay: const Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 18, bottom: 20),
                child: Text(
                  'Select Color',
                  style: theme.displaySmall?.copyWith(),
                ),
              ),
            ),
            //Colors
            FadeInUp(
              delay: const Duration(milliseconds: 600),
              child: Container(
                width: size.width,
                height: size.height * 0.08,
                // color: Colors.red,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (context, index) {
                    var currnt = colors[index];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = index;
                        });
                      },
                      child: AnimatedContainer(
                        margin: EdgeInsets.all(10),
                        width: size.width * 0.12,
                        duration: Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: currnt,
                          border: Border.all(
                              width: selectedColor == index ? 1 : 2,
                              color: selectedColor == index
                                  ? primaryColor
                                  : Colors.transparent),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 700),
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.03),
                child: ReUseAbleButton(
                  text: 'Add to Card',
                  onTap: () {
                    AddToCart.addToCart(current, context);
                  },
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
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
    );
  }
}
