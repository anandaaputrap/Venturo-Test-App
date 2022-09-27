import 'package:flutter/material.dart';
import 'package:venturomalang/models/cartmodel.dart';
import 'package:venturomalang/models/produkmodel.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];
  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProdukModel product) {
    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.produk.id == product.id);
      _carts[index].jumlahpesan++;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          produk: product,
          jumlahpesan: 1,
          note: "Tidak Ada Catatan",
        ),
      );
    }
    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].jumlahpesan++;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].jumlahpesan--;
    if (_carts[id].jumlahpesan == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.jumlahpesan;
    }
    return total;
  }

  totalProduct() {
    int total = _carts.length;
    return total;
  }

  totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.jumlahpesan * item.produk.harga);
    }
    return total;
  }

  productExist(ProdukModel product) {
    if (_carts.indexWhere((element) => element.produk.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}