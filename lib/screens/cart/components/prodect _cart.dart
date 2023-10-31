// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:line_icons/line_icons.dart';

// import '../../../data/app_data.dart';
// import '../../../main_wrapper.dart';
// import '../../../model/base_model.dart';
// import '../../../utils/constants.dart';

// class ProdectCart extends StatefulWidget {
//   const ProdectCart({super.key});

//   @override
//   State<ProdectCart> createState() => _ProdectCartState();
// }

// class _ProdectCartState extends State<ProdectCart> {
//   void onDelete(BaseModel data) {
//     setState(() {
//       if (itemOnCart.length == 1) {
//         itemOnCart.clear();
//       } else {
//         itemOnCart.removeWhere((element) => element.id == data.id);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     TextTheme theme = Theme.of(context).textTheme;
//     return SizedBox(
//         width: size.width,
//         height: size.height * 0.5,
//         child: itemOnCart.isNotEmpty
//             ? ListView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: itemOnCart.length,
//                 itemBuilder: (context, index) {
//                   var curent = itemOnCart[index];

//                   return FadeInUp(
//                     delay: Duration(milliseconds: 100 * index + 80),
//                     child: Container(
//                       margin: EdgeInsets.all(5),
//                       width: size.width,
//                       height: size.height * 0.25,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           //Prodect Image
//                           _prodectImage(size, curent),
//                           SizedBox(
//                             width: size.width * 0.01,
//                           ),
//                           //The rest of the items in the basket
//                           _elementsCart(size, curent, theme)
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               )
//             : _EmptyCart(size));
//   }
//   //The rest of the items in the basket

//   Widget _elementsCart(Size size, BaseModel curent, TextTheme theme) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 5.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: size.width * 0.52,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "${curent.name}",
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 IconButton(
//                     onPressed: () {
//                       onDelete(curent);
//                     },
//                     icon: Icon(
//                       Icons.close,
//                       color: Colors.grey,
//                     ))
//               ],
//             ),
//           ),
//           RichText(
//             text: TextSpan(
//                 text: "\$",
//                 style: theme.subtitle2?.copyWith(
//                     color: Colors.lightGreen[400],
//                     fontSize: 21,
//                     fontWeight: FontWeight.bold),
//                 children: [
//                   TextSpan(
//                     text: curent.price.toString(),
//                     style: theme.subtitle2?.copyWith(
//                         // color: Colors.black,
//                         fontSize: 17,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ]),
//           ),
//           SizedBox(
//             height: size.height * 0.04,
//           ),
//           Text(
//             'Size = ${sizes[3]}',
//             style: theme.subtitle2?.copyWith(
//                 fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w400),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: size.height * 0.053),
//             width: size.width * 0.4,
//             height: size.height * 0.04,
//             child: Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.all(4),
//                   width: size.width * 0.065,
//                   height: size.height * 0.045,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(width: 1, color: Colors.grey)),
//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(10),
//                     onTap: () {
//                       setState(() {
//                         if (curent.value > 1) {
//                           curent.value--;
//                         } else {
//                           onDelete(curent);
//                           curent.value = 1;
//                         }
//                       });
//                     },
//                     child: Icon(
//                       Icons.remove,
//                       size: 16,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
//                   child: Text(
//                     curent.value.toString(),
//                     style: theme.subtitle2?.copyWith(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 15,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(4),
//                   width: size.width * 0.065,
//                   height: size.height * 0.045,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(width: 1, color: Colors.grey)),
//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(10),
//                     onTap: () {
//                       setState(() {
//                         curent.value >= 0 ? curent.value++ : null;
//                       });
//                     },
//                     child: Icon(
//                       Icons.add,
//                       size: 16,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

// //The alternative widget in case the basket is empty
//   Widget _EmptyCart(Size size) {
//     return Column(
//       children: [
//         FadeInUp(
//           delay: const Duration(milliseconds: 200),
//           child: Image(
//             image: AssetImage('assets/images/empty.png'),
//             height: size.height * 0.3,
//             fit: BoxFit.cover,
//           ),
//         ),
//         FadeInUp(
//           delay: const Duration(milliseconds: 250),
//           child: Text(
//             'سلة التسوق الخاصة بك فارغة الأن',
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
//           ),
//         ),
//         FadeInUp(
//           delay: const Duration(milliseconds: 300),
//           child: IconButton(
//               onPressed: () {
//                 Get.off(MainWrapper());
//               },
//               icon: Icon(LineIcons.shoppingBag)),
//         )
//       ],
//     );
//   }

// //Image the cart
//   Widget _prodectImage(Size size, BaseModel curent) {
//     return Container(
//       margin: EdgeInsets.all(5),
//       width: size.width * 0.4,
//       decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage(curent.imageUrl), fit: BoxFit.cover),
//           // color: Colors.amber,
//           boxShadow: [
//             BoxShadow(
//                 offset: Offset(0, 4),
//                 color: const Color.fromARGB(61, 0, 0, 0),
//                 blurRadius: 4)
//           ]),
//     );
//   }
// }
