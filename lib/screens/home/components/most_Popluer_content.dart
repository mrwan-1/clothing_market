import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/app_data.dart';
import '../../../model/base_model.dart';
import '../../detail/detail.dart';

class MostPopluerContent extends StatelessWidget {
  const MostPopluerContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return FadeInUp(
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
                      style: theme.displayMedium,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "\$",
                        style: theme.titleSmall?.copyWith(
                            color: Colors.lightGreen[400],
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: current.price.toString(),
                            style: theme.titleSmall?.copyWith(
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
    );
  }
}
