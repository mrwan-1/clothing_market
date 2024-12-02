import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/app_data.dart';
import '../../../model/base_model.dart';
import '../../detail/detail.dart';

class BodyTheHome extends StatefulWidget {
  const BodyTheHome({super.key});

  @override
  State<BodyTheHome> createState() => _BodyTheHomeState();
}

class _BodyTheHomeState extends State<BodyTheHome> {
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
    return FadeInUp(
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
              style: theme.displayMedium,
            ),
          ),
          RichText(
            text: TextSpan(
                text: "\$",
                style: theme.displayMedium?.copyWith(
                    color: Colors.lightGreen[400],
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: data.price.toString(),
                    style: theme.displayMedium?.copyWith(
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
