// import '../../../data/app_data.dart';
// import '../../../model/base_model.dart';

// int calculateSubTotle() {
//   int SubTotle = 0;
//   if (itemOnCart.isEmpty) {
//     SubTotle = 0;
//   } else {
//     for (BaseModel data in itemOnCart) {
//       SubTotle = SubTotle + data.price.round();
//       SubTotle = SubTotle - 160;
//     }
//   }
//   return SubTotle < 0 ? 0 : SubTotle;
// }

// double calculateShopping() {
//   double shopping = 0.0;
//   if (itemOnCart.isEmpty) {
//     shopping = 0.0;
//     return shopping;
//   } else if (itemOnCart.length <= 4) {
//     shopping = 25.99;
//     return shopping;
//   } else {
//     shopping = 88.99;
//     return shopping;
//   }
// }

// double calculateTotalPrice() {
//   double totle = 0.0;
//   if (itemOnCart.isEmpty) {
//     totle = 0.0;
//   } else {
//     for (BaseModel data in itemOnCart) {
//       totle = totle + data.price * data.value;
//     }
//   }
//   return totle;
// }
