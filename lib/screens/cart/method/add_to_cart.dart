import 'package:clothing_market/model/base_model.dart';
import 'package:flutter/material.dart';
import '../../../data/app_data.dart';

class AddToCart {
  static void addToCart(BaseModel data, BuildContext context) {
    bool contains = itemOnCart.contains(data);
    if (contains) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackBar.faildSnackBar());
    } else {
      itemOnCart.add(data);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(CustomSnackBar.successSnackBar());
    }
  }
}

class CustomSnackBar {
  CustomSnackBar._();

  static successSnackBar() => SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green[400],
        content: Text('تمت الإضافة بنجاح إلى السلة!'),
        action: SnackBarAction(
            textColor: Colors.white, label: 'اغلاق', onPressed: () {}),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      );

  static faildSnackBar() => SnackBar(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red[400],
        content: Text('لقد أضفت هذا العنصر من قبل'),
        action: SnackBarAction(
            textColor: Colors.white, label: 'اغلاق', onPressed: () {}),
      );
}
