import 'package:animate_do/animate_do.dart';
import 'package:clothing_market/data/app_data.dart';
import 'package:clothing_market/main_wrapper.dart';
import 'package:clothing_market/model/base_model.dart';
import 'package:clothing_market/utils/constants.dart';
import 'package:clothing_market/widget/reuseable_button.dart';
import 'package:clothing_market/widget/reuseeablecartfor_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int calculateSubTotle() {
    int SubTotle = 0;
    if (itemOnCart.isEmpty) {
      SubTotle = 0;
    } else {
      for (BaseModel data in itemOnCart) {
        SubTotle = SubTotle + data.price.round();
        SubTotle = SubTotle - 160;
      }
    }
    return SubTotle < 0 ? 0 : SubTotle;
  }

  double calculateShopping() {
    double shopping = 0.0;
    if (itemOnCart.isEmpty) {
      shopping = 0.0;
      return shopping;
    } else if (itemOnCart.length <= 4) {
      shopping = 25.99;
      return shopping;
    } else {
      shopping = 88.99;
      return shopping;
    }
  }

  double calculateTotalPrice() {
    double totle = 0.0;

    if (itemOnCart.isEmpty) {
      totle = 0.0;
    } else {
      for (BaseModel data in itemOnCart) {
        totle = totle + data.price * data.value;
      }
    }
    return totle;
  }

  void onDelete(BaseModel data) {
    setState(() {
      if (itemOnCart.length == 1) {
        itemOnCart.clear();
      } else {
        itemOnCart.removeWhere((element) => element.id == data.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: _buildeAppBar(),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
                width: size.width,
                height: size.height * 0.5,
                child: itemOnCart.isNotEmpty
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: itemOnCart.length,
                        itemBuilder: (context, index) {
                          var curent = itemOnCart[index];

                          return FadeInUp(
                            delay: Duration(milliseconds: 100 * index + 80),
                            child: Container(
                              margin: EdgeInsets.all(5),
                              width: size.width,
                              height: size.height * 0.25,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //Prodect Image
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    width: size.width * 0.4,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(curent.imageUrl),
                                            fit: BoxFit.cover),
                                        // color: Colors.amber,
                                        boxShadow: [
                                          BoxShadow(
                                              offset: Offset(0, 4),
                                              color: const Color.fromARGB(
                                                  61, 0, 0, 0),
                                              blurRadius: 4)
                                        ]),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.01,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.52,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${curent.name}",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    onDelete(curent);
                                                  },
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: Colors.grey,
                                                  ))
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                              text: "\$",
                                              style: theme.titleSmall?.copyWith(
                                                  color: Colors.lightGreen[400],
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.bold),
                                              children: [
                                                TextSpan(
                                                  text: curent.price.toString(),
                                                  style: theme.titleSmall
                                                      ?.copyWith(
                                                          // color: Colors.black,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                ),
                                              ]),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.04,
                                        ),
                                        Text(
                                          'Size = ${sizes[3]}',
                                          style: theme.titleSmall?.copyWith(
                                              fontSize: 15,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: size.height * 0.053),
                                          width: size.width * 0.4,
                                          height: size.height * 0.04,
                                          child: Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.all(4),
                                                width: size.width * 0.065,
                                                height: size.height * 0.045,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.grey)),
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  onTap: () {
                                                    setState(() {
                                                      if (curent.value > 1) {
                                                        curent.value--;
                                                      } else {
                                                        onDelete(curent);
                                                        curent.value = 1;
                                                      }
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    size: 16,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        size.width * 0.02),
                                                child: Text(
                                                  curent.value.toString(),
                                                  style:
                                                      theme.titleSmall?.copyWith(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.all(4),
                                                width: size.width * 0.065,
                                                height: size.height * 0.045,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.grey)),
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  onTap: () {
                                                    setState(() {
                                                      curent.value >= 0
                                                          ? curent.value++
                                                          : null;
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    size: 16,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Column(
                        children: [
                          FadeInUp(
                            delay: const Duration(milliseconds: 200),
                            child: Image(
                              image: AssetImage('assets/images/empty.png'),
                              height: size.height * 0.3,
                              fit: BoxFit.cover,
                            ),
                          ),
                          FadeInUp(
                            delay: const Duration(milliseconds: 250),
                            child: Text(
                              'سلة التسوق الخاصة بك فارغة الأن',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                          ),
                          FadeInUp(
                            delay: const Duration(milliseconds: 300),
                            child: IconButton(
                                onPressed: () {
                                  Get.off(MainWrapper());
                                },
                                icon: Icon(LineIcons.shoppingBag)),
                          )
                        ],
                      )),

            //Prodect Price
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.4,
                // color: Colors.orange,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    children: [
                      FadeInUp(
                        delay: const Duration(milliseconds: 350),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Promo / Student Code Or Vourchers',
                              style: theme.displaySmall?.copyWith(fontSize: 16),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 400),
                        child: ReuseAbleCartForRow(
                            text: "Sub Totle",
                            price: calculateSubTotle().toDouble()),
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 450),
                        child: ReuseAbleCartForRow(
                            text: "Shopping", price: calculateShopping()),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(),
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 550),
                        child: ReuseAbleCartForRow(
                            text: "Totle", price: calculateTotalPrice()),
                      ),
                      FadeInUp(
                        delay: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: ReUseAbleButton(
                              text: 'CheckOut',
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Cart(),
                                    ));
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildeAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        'cart',
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 19,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              LineIcons.user,
              color: Colors.black,
            )),
      ],
    );
  }
}
