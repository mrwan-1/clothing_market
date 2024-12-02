import 'package:animate_do/animate_do.dart';
import 'package:clothing_market/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '../../data/app_data.dart';
import '../cart/method/add_to_cart.dart';
import '../../model/base_model.dart';
import '../detail/detail.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    itemOnSearch = mainList;
    super.initState();
  }

  onSearchFunc(String search) {
    setState(() {
      itemOnSearch = mainList
          .where((element) => element.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                FadeInUp(
                  delay: const Duration(milliseconds: 50),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.height * 0.02),
                    child: SizedBox(
                      width: size.width,
                      height: size.height * 0.07,
                      child: TextField(
                        controller: _controller,
                        onChanged: (value) => onSearchFunc(value),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            filled: true,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  _controller.clear();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                },
                                icon: const Icon(Icons.close)),
                            hintStyle: theme.displaySmall?.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[600],
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'e.g.cosual jeans'),
                        style: theme.displaySmall?.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Expanded(
                  child: itemOnSearch.isNotEmpty
                      ? GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: itemOnSearch.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.63, crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            BaseModel current = itemOnSearch[index];
                            return GestureDetector(
                              onTap: () {
                                Get.to(Details(
                                  data: itemOnSearch[index],
                                  isComeFromMostPopulart: true,
                                ));
                              },
                              child: FadeInUp(
                                delay: const Duration(milliseconds: 350),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      top: size.height * 0.02,
                                      left: size.height * 0.01,
                                      right: size.height * 0.01,
                                      child: Hero(
                                        tag: current.imageUrl,
                                        child: Container(
                                          margin: const EdgeInsets.all(10),
                                          width: size.width * 0.5,
                                          height: size.height * 0.28,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      current.imageUrl),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 4,
                                                  offset: Offset(0, 4),
                                                  color: Color.fromARGB(
                                                      61, 0, 0, 0),
                                                ),
                                              ]),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: size.height * 0.04,
                                      child: Text(
                                        current.name,
                                        style: theme.displayMedium,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: size.height * 0.01,
                                      child: RichText(
                                        text: TextSpan(
                                            text: "\$",
                                            style: theme.titleSmall?.copyWith(
                                                color: Colors.lightGreen[400],
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                            children: [
                                              TextSpan(
                                                text: current.price.toString(),
                                                style: theme.titleSmall
                                                    ?.copyWith(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    Positioned(
                                        top: size.height * 0.01,
                                        right: 0,
                                        child: CircleAvatar(
                                          backgroundColor: primaryColor,
                                          child: IconButton(
                                              onPressed: () {
                                                AddToCart.addToCart(
                                                    current, context);
                                                ;
                                              },
                                              icon: Icon(
                                                LineIcons.addToShoppingCart,
                                                color: Colors.white,
                                              )),
                                        ))
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage(
                                'assets/images/search.png',
                              ),
                              height: size.height * 0.3,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "نتجيه البحث فارغه ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 19),
                            )
                          ],
                        ),
                ),
              ],
            ),
          )),
    );
  }
}
