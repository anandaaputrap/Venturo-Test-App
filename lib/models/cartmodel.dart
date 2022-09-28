import 'package:venturomalang/models/produkmodel.dart';
import 'package:venturomalang/models/vouchermoder.dart';

class CartModel {
  int id;
  ProdukModel product;
  VoucherModel vocer;
  int jumlahpesan;
  String note;

  CartModel({
    this.id,
    this.product,
    this.vocer,
    this.jumlahpesan,
    this.note,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toInt();
    product = ProdukModel.fromJson(json['product']);
    vocer = VoucherModel.fromJson(json['vocer']);
    jumlahpesan = json['jumlahpesan'].toInt();
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'vocer': vocer.toJson(),
      'jumlahpesan': jumlahpesan,
      'note': note,
    };
  }

  double getTotalPrice() {
    return product.harga * jumlahpesan;
  }
}