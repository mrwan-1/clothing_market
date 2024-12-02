  import '../../../data/app_data.dart';

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