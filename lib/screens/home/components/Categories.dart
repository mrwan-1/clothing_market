import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../data/app_data.dart';
import '../../../model/categories_model.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var theme = Theme.of(context).textTheme;
    return FadeInUp(
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
                    style: theme.titleMedium,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
