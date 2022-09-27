import 'package:flutter/material.dart';
import 'package:venturomalang/models/cartmodel.dart';
import 'package:venturomalang/services/transaksiservice.dart';

class TransaksiProvider with ChangeNotifier {
  Future<bool> checkout(
    List<CartModel> carts,
    double totalPrice,
  ) async {
    try {
      if (await TransaksiService().checkout(
        carts,
        totalPrice,
      )) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);

      return false;
    }
  }
}